using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    string connection = ConfigurationManager.ConnectionStrings["connection"].ToString();
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string user = txtUsername.Text;
        string pwd = txtPassword.Text;
        DataSet dsUser = ValidateUser(user, pwd);

        if (dsUser != null && dsUser.Tables[0] != null && dsUser.Tables[0].Rows.Count > 0)
        {
            Session["User"] = dsUser.Tables[0];
            Response.Redirect("~/home.aspx");
        }
        else
        {
            Session["User"] = null;
            lblMsg.Text = "Username or Password is incorrect!";
        }

    }
    
    public DataSet ValidateUser(string username, string pwd)
    {
        try
        {
            SqlConnection con = new SqlConnection(connection);
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

    protected void lnkRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LearnerRegister.aspx");
    }
    protected void lnkForgetPwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ForgotPassword.aspx");
    }

}
