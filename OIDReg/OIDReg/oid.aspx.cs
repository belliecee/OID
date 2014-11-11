using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class oid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (id == null || id == string.Empty)
                return;

            NodeID.Value = id;
            int iid = Convert.ToInt32(id);
            GetNodeInfo(iid);

        }
        private void GetNodeInfo(int id)
        {
            DataTable dt = CMRCode.GetNode(id);
            int n = dt.Rows.Count;
            if (n < 1)
                return;

            DataRow dr = dt.Rows[0];

            
            txtNotation1.Text = "{" + Convert.ToString(dr["notation1"]) + " " + Convert.ToString(dr["unicode_label"]) + "(" + Convert.ToString(dr["primary_int"]) + ")}";
            txtNotation2.Text = Convert.ToString(dr["notation2"]) + "." + Convert.ToString(dr["primary_int"]);
            txtNotation3.Text = Convert.ToString(dr["notation3"]) + "/" + Convert.ToString(dr["secondary_id"]);
           
            lblDescription.Text = Convert.ToString(dr["description"]);
            lblInformation.Text = Convert.ToString(dr["information"]); 
            //ParentNodeID.Value = Convert.ToString(dr["node_parent_id"]);

            txtOIDInt.Text = Convert.ToString(dr["primary_int"]);
            txtOIDLabel.Text = Convert.ToString(dr["primary_int"]);
            txtOIDSecondary.Text = Convert.ToString(dr["secondary_id"]);
            txtUnicodeLabel.Text = Convert.ToString(dr["unicode_label"]);

            int node_raid = Convert.ToInt32(dr["node_raid"]);
            GetRegistrationInfo(node_raid);

            dt = CMRCode.GetFullPath(id);
            n = dt.Rows.Count;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (int i = 0; i < n; i++)
            {
                dr = dt.Rows[i];
                if (i == 0)
                {
                    sb.Append("<img src='images/dot.gif' style='border:none; vertical-align:middle'/>");
                    sb.Append("&nbsp;<a href='root.aspx'>" + dr["secondary_id"] + "(" + dr["primary_int"] + ")</a>&nbsp;");
                }
                else if (i < n - 1)
                {
                    sb.Append("<img src='images/dot.gif' style='border:none;vertical-align:middle'/>");
                    sb.Append("&nbsp;<a href='oid.aspx?id=" + dr["node_id"] + "'>" + dr["secondary_id"] + "(" + dr["primary_int"] + ")</a>&nbsp;");
                }
                else
                {
                    lblNodeID.Text = dr["secondary_id"] + "(" + dr["primary_int"] + ")";
                }
            }

            divParent.InnerHtml = sb.ToString();
        }

        private void GetRegistrationInfo(int id)
        {
            DataTable dt = CMRCode.GetRegistrationInfo(id);
            int n = dt.Rows.Count;
            if (n < 1)
                return;

            DataRow dr = dt.Rows[0];
            t1.Text = Convert.ToString(dr["org_name_th"]);
            t2.Text = Convert.ToString(dr["org_name_en"]);
            t3.Text = Convert.ToString(dr["org_ministry"]);
            t4.Text = Convert.ToString(dr["org_email"]);
            TextBox1.Text = Convert.ToString(dr["org_website"]);
            TextBox2.Text = Convert.ToString(dr["org_phone"]);
            TextBox3.Text = Convert.ToString(dr["org_address"]);
            dr.Table.Clear();
            
        }
    }
}