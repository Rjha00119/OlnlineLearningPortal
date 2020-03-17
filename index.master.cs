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

public partial class index : System.Web.UI.MasterPage
{

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("LearnerRegister.aspx");
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btnAbout_Click(object sender, EventArgs e)
    {
        Response.Redirect("AboutUs.aspx");
    }
    protected void btnCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("Courses.aspx");
    }
    protected void lnkTrainerList_Click(object sender, EventArgs e)
    {
        Response.Redirect("TrainerList.aspx");
    }
    protected void lnkContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactUs.aspx");
    }

}
