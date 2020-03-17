using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {

        }

    }

    public int InsertUserDetails(string varFirstName, string varLastName, string varEmail,
       string varPassword, string varContractNo, string RBLGender, string varAboutYourself, int RoleId, string Photo_Path)
    {
        int result = 0;
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_insertUserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@First_Name", varFirstName);
            cmd.Parameters.AddWithValue("@Last_Name", varLastName);
            cmd.Parameters.AddWithValue("@Role_Id", RoleId);
            cmd.Parameters.AddWithValue("@Email_Id", varEmail);

            cmd.Parameters.AddWithValue("@Password", varPassword);
            cmd.Parameters.AddWithValue("@Contact_No", varContractNo);
            cmd.Parameters.AddWithValue("@Gender", RBLGender);
            cmd.Parameters.AddWithValue("@Photo_Path", Photo_Path);
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

    protected void BTNSubmit_Click1(object sender, EventArgs e)
    {

        int result = InsertUserDetails(TXTFirstName.Text, txtLastName.Text, TXTEmail.Text,
            TXTPassword.Text, TXTContractNo.Text, ddlGender.SelectedValue, TXTAboutYourself.Text, Convert.ToInt32(ddlRole.SelectedValue), ""
        );

        if (result > 0)
        {
            lblmsg.Text = "User Register Successfully.";
        }
        else if (result == -1)
        {
            lblmsg.Text = "User already exists. Please login with another Email Id";
        }
        else
        {
            lblmsg.Text = "User Register failed. Please try again after sometime";
        }

        TXTFirstName.Text = "";
        txtLastName.Text = "";
        TXTEmail.Text = "";
        TXTPassword.Text = "";
        TXTConfirmPassword.Text = "";
        TXTContractNo.Text = "";
        ddlGender.ClearSelection();
        ddlRole.ClearSelection();
        ddlGender.SelectedIndex = -1;
        ddlRole.SelectedIndex = -1;
        TXTAboutYourself.Text = "";
        TXTFirstName.Focus();

    }


    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

}
