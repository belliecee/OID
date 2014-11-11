using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class FirstLogin : System.Web.UI.Page
    {
        int uid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            uid = Convert.ToInt32(Session["uid"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string u = t1.Text.Trim();
            string p1 = t2.Text.Trim();
            string p2 = t3.Text.Trim();

            if (u == string.Empty)
            {
                lblError.Text = "ใส่ชื่อ user ด้วย";
                return;
            }

            if (CMRCode.CheckUserName(uid, u) != 0)
            {
                lblError.Text = "ชื่อ user นี้ถูกใช้งานแล้ว กรุณาตั้งชื่อใหม่";
                return;
            }

            if (p1 == string.Empty || p2 == string.Empty)
            {
                lblError.Text = "password สั้นไป";
                return;
            }

            if (!p1.Equals(p2))
            {
                lblError.Text = "password ไม่ตรงกันกรุณาใส่ใหม่";
                return;
            }

            CMRCode.UpdateUserName(uid, u, p2);
            FormsAuthentication.SetAuthCookie(Convert.ToString(Session["uname"]), false);
            Response.Redirect("~/Manage/Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            CMRCode.UpdateUserName(uid);
            FormsAuthentication.SetAuthCookie(Convert.ToString(Session["uname"]), false);
            Response.Redirect("~/Manage/Default.aspx");
        }
    }
}