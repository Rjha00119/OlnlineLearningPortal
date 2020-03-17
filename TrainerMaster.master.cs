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

public partial class TrainerMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            DataTable dt = (DataTable)Session["User"];

            if (Convert.ToString(dt.Rows[0]["Role_Id"]) == "2")
            {
                lbluser.Text = Convert.ToString(dt.Rows[0]["First_Name"]) + " " + Convert.ToString(dt.Rows[0]["Last_Name"]);
            }


        }

    }

    protected void lnkManageContent_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Trainer/TrainerManageContent.aspx");
    }
    protected void lnkProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Trainer/ManageProfile.aspx");
    }
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
    protected void btnAbout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs.aspx");
    }

    protected void lnkManageQuery_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Trainer/ManageQuery.aspx");
    }


    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.Remove("User");
        Response.Redirect("~/home.aspx");
    }
}
