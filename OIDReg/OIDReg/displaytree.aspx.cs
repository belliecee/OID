using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class displaytree : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetNodeInfo(Convert.ToInt32(1));
                lblRootNode.Text = txtNotation1.Text;
            }
        }
        protected void Tree1_TreeNodeDataBound(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
        {
            System.Data.DataRowView dv = (e.Node.DataItem as System.Data.DataRowView);
            if (dv != null)
            {
                //e.Node.Target = "oid.aspx?id=" + dv["node_id"];
                e.Node.Target = ""+ dv["node_id"];
                e.Node.Text = String.Format("{0} - ({1})", dv["secondary_id"].ToString(), dv["sub_count"].ToString());
                int parent = 0;
                if (!Convert.IsDBNull(dv["node_parent_id"]))
                {
                    parent = Convert.ToInt32(dv["node_parent_id"]);
                }
                if (parent > 0)
                {
                    e.Node.Expanded = false;
                }
            }
        }
        protected void Tree1_SelectedTreeNodeChanged(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
        {
            //Label1.Text = e.Node.Target;
            //Response.Redirect(Label1.Text);

            int node_id = Convert.ToInt32(e.Node.Target);
            GetNodeInfo(node_id);
            
        }

        private void GetNodeInfo(int id)
        {
            DataTable dt = CMRCode.GetNode(id);
            int n = dt.Rows.Count;
            if (n < 1)
                return;

            DataRow dr = dt.Rows[0];


            txtNotation1.Text = "{" + Convert.ToString(dr["notation1"]) + " " + Convert.ToString(dr["secondary_id"]) + "(" + Convert.ToString(dr["primary_int"]) + ")}";
            txtNotation2.Text = Convert.ToString(dr["notation2"]) + "." + Convert.ToString(dr["primary_int"]);
            txtNotation3.Text = Convert.ToString(dr["notation3"]) + "/" + Convert.ToString(dr["unicode_label"]);

            lblDescription.Text = Convert.ToString(dr["description"]);
            lblInformation.Text = Convert.ToString(dr["information"]);
            //ParentNodeID.Value = Convert.ToString(dr["node_parent_id"]);

            txtOIDInt.Text = Convert.ToString(dr["primary_int"]);
            txtOIDLabel.Text = Convert.ToString(dr["primary_int"]);
            txtOIDSecondary.Text = Convert.ToString(dr["secondary_id"]);
            txtUnicodeLabel.Text = Convert.ToString(dr["unicode_label"]);

            lblNodeID.Text = dr["secondary_id"] + "(" + dr["primary_int"] + ")";
        }


        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Tree1.ExpandAll();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            //Tree1.Nodes[0].Expanded = false;
            Tree1.Nodes[0].Expanded = true;
            /*
            foreach (Obout.Ajax.UI.TreeView.Node n in Tree1.Nodes[0].ChildNodes)
            {
                n.Expanded = false;
            }
            */
            foreach (Obout.Ajax.UI.TreeView.Node n in Tree1.Nodes)
            {
                n.Expanded = false;
            }
        }
    }
}