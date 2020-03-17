using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ManageLearner : System.Web.UI.Page
{

    string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            DataTable dt = (DataTable)Session["User"];
            if (Convert.ToString(dt.Rows[0]["Role_Id"]) == "1")
            {

            }
            else
            {
                Response.Redirect("../home.aspx");
            }
        }
        else
        {

        }
        if (!IsPostBack)
        {
            BindGrid();
        }
    }



    private void BindGrid()
    {
        try
        {
            int TrainerId = 3;
            DataSet ds = GetUserDetails(TrainerId);
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                grdvLearner.DataSource = ds.Tables[0];
            }
            else
            {
                grdvLearner.DataSource = null;
            }
            grdvLearner.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataSet GetUserDetails(int RoleId)
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetUserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RoleId", RoleId);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds);
            con.Close();
            return ds;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }







    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        grdvLearner.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grdvLearner.EditIndex)
        {
            (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        }
    }

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        grdvLearner.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = grdvLearner.Rows[e.RowIndex];
        int UserId = Convert.ToInt32(grdvLearner.DataKeys[e.RowIndex].Values[0]);
        string txtFirst_Name = (row.FindControl("txtFirst_Name") as TextBox).Text;
        string txtLast_Name = (row.FindControl("txtLast_Name") as TextBox).Text;
        string txtContact_No = (row.FindControl("txtContact_No") as TextBox).Text;

        CheckBox chkIsApproved = (row.FindControl("chkIsApproved") as CheckBox);
        DataTable dt = (DataTable)Session["User"];
        int Approval_User_Id = Convert.ToInt32(dt.Rows[0]["User_Id"]);

        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_UpdateUserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", UserId);
            cmd.Parameters.AddWithValue("@First_Name", txtFirst_Name);
            cmd.Parameters.AddWithValue("@Last_Name", txtLast_Name);
            cmd.Parameters.AddWithValue("@Contact_No", txtContact_No);
            cmd.Parameters.AddWithValue("@Approval_Flag", chkIsApproved.Checked == true ? 1 : 0);
            cmd.Parameters.AddWithValue("@Approval_User_Id", Approval_User_Id);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        grdvLearner.EditIndex = -1;
        this.BindGrid();
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        grdvLearner.EditIndex = -1;
        this.BindGrid();
    }
    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int UserId = Convert.ToInt32(grdvLearner.DataKeys[e.RowIndex].Values[0]);
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_DeleteUserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", UserId);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }

        this.BindGrid();
    }

}
