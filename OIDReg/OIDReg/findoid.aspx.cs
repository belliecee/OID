using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class findoid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string t = Convert.ToString(Session["find"]);
                DataTable dt = CMRCode.GetNodeByNotation(t);
                if (dt.Rows.Count > 0)
                {
                    int id = Convert.ToInt32(dt.Rows[0]["node_id"]);
                    Response.Redirect("oid.aspx?id="+ id);
                }
            }
        }
    }
}