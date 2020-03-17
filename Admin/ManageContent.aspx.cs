using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_ManageContent : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    int maxFileSize = Convert.ToInt32(ConfigurationManager.AppSettings["maxFileSize"].ToString());

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
            BindCourses();
        }
    }

    private void BindCourses()
    {
        try
        {
            DataSet ds = GetCourseDetails();
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                ddlCourse.DataSource = ds.Tables[0];
                ddlCourse.DataTextField = "course_name";
                ddlCourse.DataValueField = "course_id";
            }
            else
            {
                ddlCourse.DataSource = null;
            }
            ddlCourse.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
   
    public DataSet GetCourseDetails()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetCourseDetails", con);
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

    private void BindGrid()
    {
        try
        {
            divAddNew.Visible = false;
            divMainGrid.Visible = true;

            DataSet ds = GetContentDetails();
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                grdvCourse.DataSource = ds.Tables[0];
            }
            else
            {
                grdvCourse.DataSource = null;
            }
            grdvCourse.DataBind();
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
            int user_id = 0;

            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetContentDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user_id", user_id);
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
        grdvCourse.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grdvCourse.EditIndex)
        {
            (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        }
    }

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        grdvCourse.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }



    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = grdvCourse.Rows[e.RowIndex];
        int Course_Content_id = Convert.ToInt32(grdvCourse.DataKeys[e.RowIndex].Values[0]);
        string txtContent_Name = (row.FindControl("txtContent_Name") as TextBox).Text;
        string txtDescription = (row.FindControl("txtDescription") as TextBox).Text;
        string lblCourse_Name = (row.FindControl("lblCourse_Name") as Label).Text;
        Label UploadStatusLabelGrid = (row.FindControl("UploadStatusLabelGrid") as Label);

        CheckBox chkApprovedEdit = (row.FindControl("chkApprovedEdit") as CheckBox);
        bool IsApproved = false;
        if (chkApprovedEdit.Checked)
        {
            IsApproved = true;
        }

        FileUpload file = row.FindControl("fuEditFile") as FileUpload;
        string folderPath = Server.MapPath("~/Content/");
        if (file.HasFile)
        {
            // Get the size in bytes of the file to upload.
            int fileSize = file.PostedFile.ContentLength;
            // Allow only files less than 5,100,000 bytes (approximately 5 MB) to be uploaded.
            if (fileSize < maxFileSize)
            {
                folderPath = folderPath + lblCourse_Name.Replace(" ", "").Trim() + "/";
                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath);
                }
                //Save the File to the Directory (Folder).
                folderPath = folderPath + Path.GetFileName(file.FileName);
                file.SaveAs(folderPath);
            }
            else
            {
                // Notify the user why their file was not uploaded.
                UploadStatusLabelGrid.Text = "Your file was not uploaded because " +
                                         "it exceeds the 5 MB size limit.";
                return;
            }
        }
        else
        {
            HiddenField hdnPath = (row.FindControl("hdnPath") as HiddenField);
            folderPath = Convert.ToString(hdnPath.Value);
        }
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_UpdateContentDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Course_Content_id", Course_Content_id);
            cmd.Parameters.AddWithValue("@content_name", txtContent_Name);
            cmd.Parameters.AddWithValue("@Description", txtDescription);
            cmd.Parameters.AddWithValue("@content_path", folderPath);
            cmd.Parameters.AddWithValue("@IsApproved", IsApproved);

            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        grdvCourse.EditIndex = -1;
        this.BindGrid();
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        grdvCourse.EditIndex = -1;
        this.BindGrid();
    }

    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Course_Content_id = Convert.ToInt32(grdvCourse.DataKeys[e.RowIndex].Values[0]);
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_DeleteContentDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Course_Content_id", Course_Content_id);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }

        this.BindGrid();
    }

    protected void lnkAddNew_Click(object sender, EventArgs e)
    {
        divAddNew.Visible = true;
        divMainGrid.Visible = false;
    }

    protected void lnkAllCourse_Click(object sender, EventArgs e)
    {
        divAddNew.Visible = false;
        divMainGrid.Visible = true;
        BindGrid();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strPath = "";
        if (flpUploadContent.HasFile)
        {
            // Get the size in bytes of the file to upload.
            int fileSize = flpUploadContent.PostedFile.ContentLength;
            // Allow only files less than 5,100,000 bytes (approximately 5 MB) to be uploaded.
            if (fileSize < maxFileSize)
            {
                strPath = UploadFile();
                int result = InsertContentDetails(strPath);

                if (result > 0)
                {
                    lblmsg.Text = "Content Added Successfully.";
                }
                else
                {
                    lblmsg.Text = "Content Add failed. Please try again after sometime";
                }
            }
            else
            {
                // Notify the user why their file was not uploaded.
                UploadStatusLabel.Text = "Your file was not uploaded because " +
                                         "it exceeds the 5 MB size limit.";
            }

        }
        else
        {
            lblmsg.Text = "File not found, please try again";
            return;
        }

        txtContentName.Text = "";
        txtDescription.Text = "";
        txtContentName.Focus();

    }


    public int InsertContentDetails(string strPath)
    {
        int result = 0;
        try
        {
            DataTable dt = (DataTable)Session["User"];
            int user_id = Convert.ToInt32(dt.Rows[0]["User_Id"]);

            string varContentName = txtContentName.Text.Trim();
            string varDesc = txtDescription.Text.Trim();
            int course_id = Convert.ToInt32(ddlCourse.SelectedValue);
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_InsertContentDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@content_name", varContentName);
            cmd.Parameters.AddWithValue("@Description", varDesc);
            cmd.Parameters.AddWithValue("@content_path", strPath);
            cmd.Parameters.AddWithValue("@course_id", course_id);
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


    private string UploadFile()
    {
        string folderPath = Server.MapPath("~/Content/");

        folderPath = folderPath + ddlCourse.SelectedItem.Text.Replace(" ", "").Trim() + "/";

        //Check whether Directory (Folder) exists.
        if (!Directory.Exists(folderPath))
        {
            //If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath);
        }
        //Save the File to the Directory (Folder).
        folderPath = folderPath + Path.GetFileName(flpUploadContent.FileName);
        flpUploadContent.SaveAs(folderPath);
        return folderPath;

    }

    protected void lnkDownload_Click(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        if (!System.IO.File.Exists(filePath))
        {
            //LinkButton lnk = sender as LinkButton;
            //GridViewRow gvr = lnk.NamingContainer as GridViewRow;
            //Label UploadStatusLabelGrid = gvr.FindControl("UploadStatusLabelGrid") as Label;
            //UploadStatusLabelGrid.Text = "No File found.";

            return;
        }
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();

    }


}
