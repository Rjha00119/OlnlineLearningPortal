using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class TrainerList : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            DataTable dt = (DataTable)Session["User"];

            if (dt != null && dt.Rows.Count > 0 &&
                Convert.ToString(dt.Rows[0]["Role_Id"]) == "1")
            {
                this.MasterPageFile = "adminMaster.master";
            }
            else
            {
                if (dt != null && dt.Rows.Count > 0 &&
                Convert.ToString(dt.Rows[0]["Role_Id"]) == "2")
                {
                    this.MasterPageFile = "TrainerMaster.master";
                }
                else
                {
                    if (dt != null && dt.Rows.Count > 0 &&
               Convert.ToString(dt.Rows[0]["Role_Id"]) == "3")
                    {
                        this.MasterPageFile = "LearnerMaster.master";
                    }
                }
            }

        }
        else
        {
            this.MasterPageFile = "index.master";
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();

        }

    }




    public DataSet GetUserDetails()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetUserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RoleId", 2);
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

    private void BindGrid()
    {
        try
        {
            DataSet ds = GetUserDetails();
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {

                //Checking the RowType of the Row  
                foreach (DataRow dr in ds.Tables[0].AsEnumerable())
                {
                    dr["ImageIcon"] = "~/images/trainer.png";
                }

                grdvContents.DataSource = ds.Tables[0];
            }
            else
            {
                grdvContents.DataSource = null;
            }
            grdvContents.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }





    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        grdvContents.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }


    protected void btnDownload_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {

            string filePath = (sender as Button).CommandArgument;
            if (!System.IO.File.Exists(filePath))
            {
                return;
            }
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }

    }
}
