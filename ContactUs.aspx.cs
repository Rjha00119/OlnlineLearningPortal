using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ContactUs : System.Web.UI.Page
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

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string varName = txtName.Text.Trim();
            string varEmail = txtEmail.Text.Trim();
            string varContact = txtContact.Text.Trim();
            string varQuery = txtQuery.Text.Trim();


            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_InsertQueryDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", varName);
            cmd.Parameters.AddWithValue("@Email_Id", varEmail);
            cmd.Parameters.AddWithValue("@Contact_No", varContact);
            cmd.Parameters.AddWithValue("@Query", varQuery);
            cmd.Parameters.AddWithValue("@User_Id", 0);

            con.Open();

            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                lblMsg.Text = "Thank you for your query. We will revert you on Email or Contact No";
                txtContact.Text = "";
                txtEmail.Text = "";
                txtName.Text = "";
                txtQuery.Text = "";

            }

            con.Close();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}
