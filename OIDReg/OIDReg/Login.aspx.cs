using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //int uid = ResellerDB.Login(
            string u = t1.Text.Trim();
            string p = t2.Text.Trim();
            string ip = Request.ServerVariables["REMOTE_ADDR"];
            int uid = CMRCode.Login(u, p, ip);
            if (uid > 0)
            {
                Session["uid"] = uid;
                Session["uname"] = u;
                int login_attempt = LoadInfo(uid);
                if (login_attempt == 0)
                {
                    // first login
                    Response.Redirect("FirstLogin.aspx");
                }


                if (Request.QueryString["ReturnUrl"] != null)
                {
                    //FormsAuthentication.RedirectFromLoginPage("annop", false);
                    //Response.Redirect("~/Reseller/Default.aspx");
                    
                    FormsAuthentication.SetAuthCookie(u, false);                    
                    FormsAuthentication.RedirectFromLoginPage(u, true);
                }
                else
                {
                    FormsAuthentication.SetAuthCookie(u, false);
                    Response.Redirect("~/Manage/Default.aspx");
                }

            }
            else
            {
                this.lblError.Text = "ชื่อหรือรหัสผ่านผู้ใช้งานไม่ภูกต้อง";
            }
        }
        protected int LoadInfo(int uid)
        {
            DataTable dt = CMRCode.GetUserInfo(uid);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Session["root"] = Convert.ToString(dr["node_id"]);
                Session["raid"] = Convert.ToString(dr["node_raid"]);
                Session["gid"] = Convert.ToString(dr["gid"]);

                return (Convert.IsDBNull(dr["first_login"])) ? (0) : (1);
            }
            return 0;
        }
    }


}