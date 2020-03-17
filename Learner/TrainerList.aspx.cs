using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Learner_TrainerList : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            DataTable dt = (DataTable)Session["User"];
            if (Convert.ToString(dt.Rows[0]["Role_Id"]) == "3")
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
            int TrainerId = 2;
            DataSet ds = GetUserDetails(TrainerId);
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                grdvTrainer.DataSource = ds.Tables[0];
            }
            else
            {
                grdvTrainer.DataSource = null;
            }
            grdvTrainer.DataBind();
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
        grdvTrainer.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }



}
