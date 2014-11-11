using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string t = Convert.ToString(Session["search"]);
            DataTable dt = CMRCode.GetSearchList(t);
            int n = dt.Rows.Count;
            if (n > 0)
            {
                if (n > 100)
                {
                    lblLabel.Text = "Found too many OIDs matching your query (only the first 100 are displayed):";
                }
                else
                {
                    lblLabel.Text = "Found " + n + " OIDs matching your query:";
                }
            }
            else
            {
                lblLabel.Text = "Found no OID matching your query";
            }
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

        }
    }
}