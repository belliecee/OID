using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg.Manage
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int uid = Convert.ToInt32(Session["uid"]);
                LoadInfo(uid);
            }
        }
        protected string GetStringField(object f)
        {
            if (Convert.IsDBNull(f))
            {
                return "";
            }
            else
                return Convert.ToString(f);
        }
        protected void LoadInfo(int uid)
        {
            DataTable dt = CMRCode.GetUserInfo(uid);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblName.Text = GetStringField(dr["org_name_th"]);
                lblAddress.Text = GetStringField(dr["org_address"]);
                lblPhone.Text = GetStringField(dr["org_phone"]);
                lblEmail.Text = GetStringField(dr["org_email"]);

                txtNotation1.Text = "{" + Convert.ToString(dr["notation1"]) + " " + Convert.ToString(dr["unicode_label"]) + "(" + Convert.ToString(dr["primary_int"]) + ")}";
                txtNotation2.Text = Convert.ToString(dr["notation2"]) + "." + Convert.ToString(dr["primary_int"]);
                txtNotation3.Text = Convert.ToString(dr["notation3"]) + "/" + Convert.ToString(dr["secondary_id"]);

                lblDescription.Text = Convert.ToString(dr["description"]);
                lblInformation.Text = Convert.ToString(dr["information"]);
                //ParentNodeID.Value = Convert.ToString(dr["node_parent_id"]);

                hidOID.Value = Convert.ToString(dr["node_id"]);
                Session["root"] = Convert.ToString(dr["node_id"]);
                Session["raid"] = Convert.ToString(dr["node_raid"]);
                txtOIDInt.Text = Convert.ToString(dr["primary_int"]);
                txtOIDLabel.Text = Convert.ToString(dr["primary_int"]);
                txtOIDSecondary.Text = Convert.ToString(dr["secondary_id"]);
                txtUnicodeLabel.Text = Convert.ToString(dr["unicode_label"]);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("oid.aspx?id=" + hidOID.Value);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["subnode_root"] = hidOID.Value;
            Response.Redirect("newoid.aspx");
        }
    }
}