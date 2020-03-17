using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class Learner_FavouriteDetails : System.Web.UI.Page
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
            DataTable dt = (DataTable)Session["User"];
            int user_id = Convert.ToInt32(dt.Rows[0]["User_Id"]);
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetFavouriteContentDetails", con);
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
