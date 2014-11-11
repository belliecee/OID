using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class received : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string file_path = Server.MapPath(Path.Combine("~/App_Data/"));
            //string file_path = ConfigurationManager.AppSettings["OIDFolder"];
            //CMRCode.NotifyRequestToChange("17", file_path);

            Response.Redirect("default.aspx");
        }
    }
}