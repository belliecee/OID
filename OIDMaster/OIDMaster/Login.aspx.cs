using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OIDMaster
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                t1.Focus();
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string u = this.t1.Text.Trim();
            string p = this.t2.Text.Trim();
            string ip = Request.ServerVariables["REMOTE_ADDR"];
            if (check_user(u, p, ip) == 0)
            {
                Session["username"] = u;
                 
                FormsAuthentication.RedirectFromLoginPage(u, true);
            }
            else
            {


                lblError.Text = "ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง";
            }
        }
        private int check_user(string u, string p, string ip)
        {
            //Session["uid"] = 1;
            int uid = -1;
            int gid = -1;
            uid = CMRCode.StaffLogin(u, p, ip, out gid);
            Session["uid"] = uid;
            Session["gid"] = gid;
            return (uid > 0) ? (0) : (-1);
        }
    }
}