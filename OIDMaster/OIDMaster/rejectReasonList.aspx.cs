using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class rejectReasonList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item;
        if (item.ItemType == ListViewItemType.DataItem)
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            int regid = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "rejectReason_id"));
            LinkButton link = (LinkButton)item.FindControl("lnkDetail");
            if (link != null)
            {
                link.Attributes["reason_id"] = regid.ToString();
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int id = Convert.ToInt32(lb.Attributes["reason_id"]);
        Response.Redirect("rejectReason.aspx?id=" + id);
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList d = (DropDownList)sender;
        d.Items.Insert(0, new ListItem("ทั้งหมด", "0"));
    }
}