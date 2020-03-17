using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ManageCourse : System.Web.UI.Page
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

            divAddNew.Visible = false;
            divMainGrid.Visible = true;

            DataSet ds = GetCourseDetails();
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
        int course_id = Convert.ToInt32(grdvCourse.DataKeys[e.RowIndex].Values[0]);
        string txtcourse_name = (row.FindControl("txtcourse_name") as TextBox).Text;
        string txtDescription = (row.FindControl("txtDescription") as TextBox).Text;

        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_UpdateCourseDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@course_id", course_id);
            cmd.Parameters.AddWithValue("@course_Name", txtcourse_name);
            cmd.Parameters.AddWithValue("@Description", txtDescription);
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
        int course_id = Convert.ToInt32(grdvCourse.DataKeys[e.RowIndex].Values[0]);
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("p_DeleteCourseDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@course_id", course_id);
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

        int result = InsertCourseDetails(txtCourseName.Text, txtDescription.Text);

        if (result > 0)
        {
            lblmsg.Text = "Course Added Successfully.";
        }
        else
        {
            lblmsg.Text = "Course Add failed. Please try again after sometime";
        }

        txtCourseName.Text = "";
        txtDescription.Text = "";
        txtCourseName.Focus();

    }


    public int InsertCourseDetails(string varCourseName, string varDesc)
    {
        int result = 0;
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_InsertCourseDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@course_name", varCourseName);
            cmd.Parameters.AddWithValue("@Description", varDesc);
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
