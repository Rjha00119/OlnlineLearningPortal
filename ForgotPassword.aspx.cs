using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ForgotPassword : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string varEmail = txtEmail.Text.Trim();
            string varContact = txtContact.Text.Trim();
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_CheckPasswordDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email_Id", varEmail);
            cmd.Parameters.AddWithValue("@Contact_No", varContact);
            con.Open();
            DataSet dsUser = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dsUser);
            con.Close();

            if (dsUser != null && dsUser.Tables[0] != null && dsUser.Tables[0].Rows.Count > 0)
            {
                lblMsg.Text = "Thank you. Your password will send in your Email";
                txtContact.Text = "";
                txtEmail.Text = "";

            }
            else
            {
                lblMsg.Text = "Incorrect Contact No or Email Id";
                txtContact.Text = "";
                txtEmail.Text = "";
            }


            con.Close();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
