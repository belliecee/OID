using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg.Manage
{
    public partial class newoid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Convert.ToString(Session["subnode_root"]);
                if (id == null || id == string.Empty)
                    return;

                GetRootNode(Convert.ToInt32(id));
            }
        }
        private void GetRootNode(int id)
        {
            DataTable dt = CMRCode.GetNode(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string root = Convert.ToString(dr["notation2"]) + "." + Convert.ToString(dr["primary_int"]);
                txtRoot.Text = root;
                RootID.Value = root;
                RootNode.Value = Convert.ToString(dr["node_id"]);
            }
        }
        private int CheckEmptyFields(TextBox t, Label l)
        {
            if (t.Text.Trim() == string.Empty)
            {
                l.Text = " ต้องการข้อมูล ";
                return 1;
            }
            return 0;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
                FormsAuthentication.RedirectToLoginPage();

            int pid = Convert.ToInt32(RootNode.Value);

            string root = txtRoot.Text.Trim();
            string oidint = txtOIDInt.Text.Trim();
            string label = txtOIDLabel.Text.Trim();
            string secondary = txtOIDSecondary.Text.Trim();
            string ulabel = txtUnicodeLabel.Text.Trim();

            string info = txtInformation.Text.Trim();
            string description = txtDescription.Text.Trim();


            lblOIDInt.Text = "*";
            lblOIDLabel.Text = "*";
            lblOIDSecondary.Text = "*";
            lblUnicodeLabel.Text = "*";

            int oid = -1;
            try
            {
                oid = Convert.ToInt32(oidint);
                int count = CMRCode.CheckOIDInt(pid, oid);
                if (count > 0)
                {
                    lblError.Text = "หมายเลข OID นี้มีการใช้ในโดเมนของท่านแล้ว";
                    return;
                }

                if (!Convert.ToString(oid).Equals(label))
                {
                    lblError.Text = "หมายเลข OID ไม่ตรงกับป้ายชื่อยูนิโค๊ดแบบจำนวนเต็ม ";
                    return;
                }
            }
            catch 
            {
                lblError.Text = "หมายเลข OID ไม่ถูกต้อง";
                return;
            }

            int ec = 0;
            ec += CheckEmptyFields(txtOIDLabel, lblOIDLabel);
            ec += CheckEmptyFields(txtOIDSecondary, lblOIDSecondary);
            ec += CheckEmptyFields(txtUnicodeLabel, lblUnicodeLabel);
            if (ec > 0)
            {
                lblError.Text = "ข้อมูลไม่ครบถ้วน กรุณากลับไปกรอกใหม่";
                return;
            }

            if (CMRCode.NodeCheckSecondary(secondary) > 0)
            {
                lblOIDSecondary.Text = "ข้อมูล [secondary] ไม่ถูกต้องตามมาตรฐานที่กำหนด";
                lblError.Text = "ข้อมูล oid ไม่ถูกต้องตามมาตรฐาน กรุณากลับไปกรอกใหม่";
                return;
            }

            if (CMRCode.NodeCheckULabel(ulabel) > 0)
            {
                lblUnicodeLabel.Text = "ข้อมูล [unicode label] ไม่ถูกต้องตามมาตรฐานที่กำหนด";
                lblError.Text = "ข้อมูล oid ไม่ถูกต้องตามมาตรฐาน กรุณากลับไปกรอกใหม่";
                return;
            }

            int oidcheck = CMRCode.CheckOIDEntry(pid, secondary, ulabel);
            if (oidcheck > 0)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("ข้อมูล OID ซ้ำ - กรุณาระบุใหม่, ");
                if ((oidcheck & 2) == 2)
                    sb.Append(" [secondary]");

                if ((oidcheck & 4) == 4)
                    sb.Append(" [unicode label]");

                lblError.Text = sb.ToString();
                return;
            }



            /* check root id */
            int oroot_length = RootID.Value.Length;
            if (root.Length < oroot_length)
            {
                lblError.Text = "INVALID ROOT IDENTIFIER";
                return;
            }
            if (!root.Substring(0, oroot_length).Equals(root))
            {
                lblError.Text = "INVALID ROOT IDENTIFIER";
                return;
            }

            try
            {
                int regid = Convert.ToInt32(Session["raid"]);
                CMRCode.CreateNode(regid, pid, oid, label, secondary, ulabel, info, description);
                Response.Redirect("oidchanged.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = "SUBMIT ERROR : " + ex.Message;
            }
        }
    }
}