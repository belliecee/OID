using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OIDReg.Manage
{
    public partial class Detail : System.Web.UI.Page
    {
        int item_no = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {            
            ListViewItem item = e.Item;
            if (item.ItemType == ListViewItemType.DataItem)
            {
                item_no = item_no + 1;

                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                HtmlTableCell td = (HtmlTableCell)item.FindControl("td_no");
                if (td != null)
                {

                    td.InnerHtml = item_no.ToString();
                }
            }
        }
    }
}