using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Trainer_ManageQuery : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            DataTable dt = (DataTable)Session["User"];
            if (Convert.ToString(dt.Rows[0]["Role_Id"]) == "2")
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
            DataSet ds = GetQueryDetails();
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

    public DataSet GetQueryDetails()
    {
        try
        {
            DataTable dt = (DataTable)Session["User"];
            int user_id = Convert.ToInt32(dt.Rows[0]["User_Id"]);

            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetTrainerQueryDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User_Id", user_id);
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
        int Query_Id = Convert.ToInt32(grdvLearner.DataKeys[e.RowIndex].Values[0]);
        string txtSolution = (row.FindControl("txtSolution") as TextBox).Text;
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_UpdateQueryDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Query_Id", Query_Id);
            cmd.Parameters.AddWithValue("@Solution", txtSolution);

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
        int Query_Id = Convert.ToInt32(grdvLearner.DataKeys[e.RowIndex].Values[0]);
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_DeleteQueryDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Query_Id", Query_Id);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }

        this.BindGrid();
    }


}
