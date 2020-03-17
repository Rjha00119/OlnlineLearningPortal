using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class adminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            DataTable dt = (DataTable)Session["User"];

            if (Convert.ToString(dt.Rows[0]["Role_Id"]) == "1")
            {
                lbluser.Text = Convert.ToString(dt.Rows[0]["First_Name"]) + " " + Convert.ToString(dt.Rows[0]["Last_Name"]);
            }


        }

    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.Remove("User");
        Response.Redirect("~/home.aspx");
    }

    protected void lnkManageTrainer_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/ManageTrainer.aspx");
    }
    protected void lnkManageLearner_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/ManageLearner.aspx");
    }
    protected void lnkManageCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/ManageCourse.aspx");
    }
    protected void lnkManageContent_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/ManageContent.aspx");
    }
    protected void lnkQueryRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/QueryRegister.aspx");
    }
}
