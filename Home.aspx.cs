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

public partial class Home : System.Web.UI.Page
{
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
}
