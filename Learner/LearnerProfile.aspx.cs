using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Learner_LearnerProfile : System.Web.UI.Page
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

            GetUserDetails();
        }

    }


    public void GetUserDetails()
    {
        try
        {
            divEditUser.Visible = false;
            divUser.Visible = true;
            lblmsg.Text = "";
            DataTable dsUser = (DataTable)Session["User"];

            if (dsUser != null && dsUser.Rows.Count > 0)
            {
                lblEmail_id.Text = Convert.ToString(dsUser.Rows[0]["Email_Id"]);
                lblF_name.Text = Convert.ToString(dsUser.Rows[0]["First_Name"]);
                lblL_name.Text = Convert.ToString(dsUser.Rows[0]["Last_Name"]);
                lblGender.Text = Convert.ToString(dsUser.Rows[0]["Gender"]);
                lblContact_no.Text = Convert.ToString(dsUser.Rows[0]["Contact_No"]);
                lblAbout_urslf.Text = Convert.ToString(dsUser.Rows[0]["About_user"]);
                hdnUserId.Value = Convert.ToString(dsUser.Rows[0]["User_Id"]);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        divEditUser.Visible = true;
        divUser.Visible = false;

        DataTable dsUser = (DataTable)Session["User"];

        if (dsUser != null && dsUser.Rows.Count > 0)
        {
            TXTFirstName.Text = Convert.ToString(dsUser.Rows[0]["First_Name"]);
            txtLastName.Text = Convert.ToString(dsUser.Rows[0]["Last_Name"]);
            TXTPassword.Attributes["value"] = Convert.ToString(dsUser.Rows[0]["Password"]);
            TXTConfirmPassword.Attributes["value"] = Convert.ToString(dsUser.Rows[0]["Password"]);
            ddlGender.ClearSelection();
            ddlGender.Items.FindByValue(Convert.ToString(dsUser.Rows[0]["Gender"])).Selected = true;
            TXTContractNo.Text = Convert.ToString(dsUser.Rows[0]["Contact_No"]);
            TXTAboutYourself.Text = Convert.ToString(dsUser.Rows[0]["About_user"]);
        }

    }

    protected void lnkProfile_Click(object sender, EventArgs e)
    {
        divEditUser.Visible = false;
        divUser.Visible = true;
        GetUserDetails();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int result = InsertUserDetails(TXTFirstName.Text, txtLastName.Text,
            TXTPassword.Text, TXTContractNo.Text, ddlGender.SelectedValue, TXTAboutYourself.Text, Convert.ToInt32(hdnUserId.Value)
        );
        if (result > 0)
        {
            DataTable dsUser = (DataTable)Session["User"];
            if (dsUser != null && dsUser.Rows.Count > 0)
            {

                DataSet ds = ValidateUser(Convert.ToString(dsUser.Rows[0]["Email_Id"]), Convert.ToString(dsUser.Rows[0]["Password"]));
                if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    Session["User"] = ds.Tables[0];
                }
            }
            lblmsg.Text = "User Register Successfully.";
        }
        else
        {
            lblmsg.Text = "User Register failed. Please try again after sometime";
        }

        TXTFirstName.Text = "";
        txtLastName.Text = "";
        TXTPassword.Attributes["value"] = "";
        TXTConfirmPassword.Attributes["value"] = "";
        TXTContractNo.Text = "";
        ddlGender.ClearSelection();
        ddlGender.SelectedIndex = -1;
        TXTAboutYourself.Text = "";

    }

    public DataSet ValidateUser(string username, string pwd)
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("sp_ValidateLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@pwd", pwd);
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

    public int InsertUserDetails(string varFirstName, string varLastName,
     string varPassword, string varContractNo, string RBLGender, string varAboutYourself, int User_Id)
    {
        int result = 0;
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_UpdateProfileDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User_Id", User_Id);
            cmd.Parameters.AddWithValue("@First_Name", varFirstName);
            cmd.Parameters.AddWithValue("@Last_Name", varLastName);
            cmd.Parameters.AddWithValue("@Password", varPassword);
            cmd.Parameters.AddWithValue("@Contact_No", varContractNo);
            cmd.Parameters.AddWithValue("@Gender", RBLGender);
            cmd.Parameters.AddWithValue("@About_user", varAboutYourself);
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
