using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OIDReg.Manage
{
    public partial class request : System.Web.UI.Page
    {
        int uid = 0;
        int gid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            uid = Convert.ToInt32(Session["uid"]);
            gid = Convert.ToInt32(Session["gid"]);
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = e.Item;
            if (item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                HtmlGenericControl div = (HtmlGenericControl)item.FindControl("divInfo");
                if (div != null)
                {
                    int node = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "request_parent_id"));
                    if (node > 0)
                    {
                        DataTable dt = CMRCode.GetNode(node);
                        string parent1 = dt.Rows[0]["notation2"] + "." + dt.Rows[0]["primary_int"];
                        string parent2 = dt.Rows[0]["notation1"] + " (" + dt.Rows[0]["primary_int"] + ")";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<span style='color:blue'>" + parent1 + "." + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_oid_int")) + "</span><br>");
                        sb.Append("" + parent2 + " " + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_secondary_id")) + " (" + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_oid_int")) + ")<br>");
                        sb.Append("<div style='margin-top:5px;padding-top:5px; border-top:2px dashed #ccc'>");
                        sb.Append(Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_information")));
                        sb.Append("</div>");
                        div.InnerHtml = sb.ToString();
                    }
                    else 
                    {

                    }
                }

                int status = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "request_status"));

                LinkButton lbDetail = (LinkButton)item.FindControl("lnkDetail");
                LinkButton lb = (LinkButton)item.FindControl("linkSubmit");
                 
                if (lb != null && lbDetail != null) {                                       
                    // visible to grop #2 and open status only
                    //lb.Visible = (gid == 2) && (status == 0); 
                    if (gid == 1)
                    {
                        lb.Visible = false;         
                
                    }
                    else if ((gid == 2) && (status == 0))
                    {
                        lb.Visible = true;                        
                    }
                    else if ((gid == 2) && (status == 1))
                    {
                        lb.Visible = false;
                    }
                    else if ((gid == 2) && (status == 2))
                    {
                        lb.Visible = false;                        
                    }
                    lb.Attributes["reqid"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_id"));
                    
                    lbDetail.Attributes["reqid"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_id"));
                }
                

                lb = (LinkButton)item.FindControl("lnkDelete");
                if (lb != null)
                {
                    if ((gid == 2) && (status == 1))
                    {
                        lb.Visible = false;
                    }else{
                        lb.Visible = (gid == 1 && status == 0) || (gid == 2 && status < 2);
                    }
                    
                    lb.Attributes["reqid"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_id"));
                }
            }
        }

        protected void ListView2_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = e.Item;
            if (item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                HtmlGenericControl div = (HtmlGenericControl)item.FindControl("divInfo");
                if (div != null)
                {
                    string parent1 = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "notation2")) + "." + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "primary_int"));
                    string parent2 = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "notation1")) + " (" + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "primary_int")) + ")";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<span style='color:blue'>" + parent1 + "." + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "primary_int")) + "</span><br>");
                    sb.Append("" + parent2 + " " + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "secondary_id")) + " (" + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "primary_int")) + ")<br>");
                    sb.Append("<div style='margin-top:5px;padding-top:5px; border-top:2px dashed #ccc'>");
                    sb.Append(Convert.ToString(DataBinder.Eval(dataItem.DataItem, "information")));
                    sb.Append("</div>");
                    div.InnerHtml = sb.ToString();
                }
            }
        }

        protected void SendRequest_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int reqid = Convert.ToInt32(lb.Attributes["reqid"]);
            CMRCode.ConfirmNode(reqid, uid);
            ListView1.DataBind();
        }
       
        protected void Detail_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int reqid = Convert.ToInt32(lb.Attributes["reqid"]);
            Session["requestentry"] = reqid;
            Response.Redirect("Detail.aspx");
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int reqid = Convert.ToInt32(lb.Attributes["reqid"]);
            CMRCode.DeleteNodeRequest(reqid, uid);
            ListView1.DataBind();
        }
    }
}