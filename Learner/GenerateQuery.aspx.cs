using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Learner_GenerateQuery : System.Web.UI.Page
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
            BindTrainer();
        }
    }

    private void BindTrainer()
    {
        try
        {
            int TrainerId = 2;
            DataSet ds = GetUserDetails(TrainerId);
            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                ddlTrainer.DataSource = ds.Tables[0];
                ddlTrainer.DataTextField = "TrainerName";
                ddlTrainer.DataValueField = "user_id";
                ddlTrainer.DataBind();
                ddlTrainer.Items.Insert(0, "Select Trainer");
            }
            else
            {
                ddlTrainer.DataSource = null;
                ddlTrainer.DataBind();
            }



        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataSet GetUserDetails(int RoleId)
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("p_GetUserDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RoleId", RoleId);
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
            if (ddlTrainer.SelectedIndex > 0 && txtName.Text != "" && txtEmail.Text != "")
            {
                string varName = txtName.Text.Trim();
                string varEmail = txtEmail.Text.Trim();
                string varContact = txtContact.Text.Trim();
                string varQuery = txtQuery.Text.Trim();

                int user_id = Convert.ToInt32(ddlTrainer.SelectedValue);


                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("p_InsertQueryDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", varName);
                cmd.Parameters.AddWithValue("@Email_Id", varEmail);
                cmd.Parameters.AddWithValue("@Contact_No", varContact);
                cmd.Parameters.AddWithValue("@Query", varQuery);
                cmd.Parameters.AddWithValue("@User_Id", user_id);

                con.Open();

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    lblMsg.Text = "Thank you for your query. We will revert you on Email or Contact No";
                    txtContact.Text = "";
                    txtEmail.Text = "";
                    txtName.Text = "";
                    txtQuery.Text = "";
                    ddlTrainer.ClearSelection();

                }

                con.Close();
            }
            else
            {
                lblMsg.Text = "Trainer, Email Id and Contact No cannot be blank";
            }

       
    }
}
