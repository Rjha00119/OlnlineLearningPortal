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

public partial class LearnerMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            DataTable dt = (DataTable)Session["User"];

            if (Convert.ToString(dt.Rows[0]["Role_Id"]) == "3")
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
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
    protected void btnAbout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AboutUs.aspx");
    }
    protected void btnCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Courses.aspx");
    }
    protected void lnkProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Learner/LearnerProfile.aspx");
    }
    protected void lnkTrainerList_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TrainerList.aspx");
    }
    protected void lnkContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Learner/GenerateQuery.aspx");
    }
    protected void lnkFavuorite_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Learner/FavouriteDetails.aspx");
    }



}
