using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class root : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            int iid = Convert.ToInt32(id);
            GetRootInfo(iid);
        }
    }

    private void GetRootInfo(int id)
    {
        DataTable dt = CMRCode.GetNode(id);
        int n = dt.Rows.Count;
        if (n < 1)
            return;

        DataRow dr = dt.Rows[0];


        //txtNotation1.Text = "{" + Convert.ToString(dr["notation1"]) + " " + Convert.ToString(dr["unicode_label"]) + "(" + Convert.ToString(dr["primary_int"]) + ")}";
        //txtNotation2.Text = Convert.ToString(dr["notation2"]) + "." + Convert.ToString(dr["primary_int"]);
        //txtNotation3.Text = Convert.ToString(dr["notation3"]) + "/" + Convert.ToString(dr["secondary_id"]);

        //lblDescription.Text = Convert.ToString(dr["description"]);
        //lblInformation.Text = Convert.ToString(dr["information"]);
        ////ParentNodeID.Value = Convert.ToString(dr["node_parent_id"]);

        //txtOIDInt.Text = Convert.ToString(dr["primary_int"]);
        //txtOIDLabel.Text = Convert.ToString(dr["primary_int"]);
        //txtOIDSecondary.Text = Convert.ToString(dr["secondary_id"]);
        //txtUnicodeLabel.Text = Convert.ToString(dr["unicode_label"]);
    }

}
 