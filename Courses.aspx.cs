using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Courses : System.Web.UI.Page
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

    private void BindGrid()
    {
        try
        {


            DataSet ds = GetContentDetails();
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {

                //Checking the RowType of the Row  
                foreach (DataRow dr in ds.Tables[0].AsEnumerable())
                {

                    string str = Convert.ToString(dr["Content_Path"]);
                    str = Path.GetExtension(str);
                    switch (str)
                    {
                        case ".pdf":
                            dr["ImageIcon"] = "~/images/pdf.png";
                            break;
                        case ".doc":
                            dr["ImageIcon"] = "~/images/doc.png";
                            break;
                        case ".xls":
                            dr["ImageIcon"] = "~/images/xls.png";
                            break;
                        case ".txt":
                            dr["ImageIcon"] = "~/images/txt.png";
                            break;
                        case ".jpg":
                            dr["ImageIcon"] = "~/images/jpg.png";
                            break;
                        default:
                            dr["ImageIcon"] = "~/images/default.png";
                            break;


                    }

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



    public DataSet GetContentDetails()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetAllContentDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
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

    protected void btnFaviourte_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            string Course_Content_id = (sender as Button).CommandArgument;
            int result = InsertContentDetails(Course_Content_id);

            if (result > 0)
            {

                lblMsg.Text = "Favourite Added Successfully."; 
            }
            else
            {
                lblMsg.Text = "Please try again";
            }
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }

    }

    public int InsertContentDetails(string Course_Content_id)
    {
        int result = 0;
        try
        {
            DataTable dt = (DataTable)Session["User"];
            int user_id = Convert.ToInt32(dt.Rows[0]["User_Id"]);

            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_InsertFavouriteContent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Course_Content_id", Course_Content_id);
            cmd.Parameters.AddWithValue("@user_id", user_id);

            con.Open();

            result = cmd.ExecuteNonQuery();

            con.Close();
            return result;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


}
