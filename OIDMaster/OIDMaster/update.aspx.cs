using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OIDMaster
{
    public partial class update : System.Web.UI.Page
    {
        int uid = 0;
        int gid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            uid = Convert.ToInt32(Session["uid"]);
            gid = Convert.ToInt32(Session["gid"]);
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

                div = (HtmlGenericControl)item.FindControl("divOwner");
                if (div != null)
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(Convert.ToString(DataBinder.Eval(dataItem.DataItem, "app_name_th")) + "<br>" + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "org_name_th")));
                    sb.Append("<br>OID <span style='color:blue;'>" + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "notation2")) + "." + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "primary_int")));
                    sb.Append("</span>");
                    div.InnerHtml = sb.ToString();
                }

                CheckBox chk = (CheckBox)item.FindControl("chkItem");
                if (chk != null)
                {
                    chk.Attributes["chkID"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_id"));
                }
                
            }

        }
        protected void Detail_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int reqid = Convert.ToInt32(lb.Attributes["reqid"]);            
            Session["requestentry"] = reqid;
            Response.Redirect("Detail.aspx");
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

                LinkButton lb = (LinkButton)item.FindControl("linkSubmit");
                if (lb != null)
                {
                    int status = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "request_status"));

                    // visible to grop #2 and open status only
                    lb.Visible = (gid == 1) && (status == 1);
                    lb.Attributes["reqid"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_id"));
                }

                LinkButton lbDetail = (LinkButton)item.FindControl("lnkDetail");
                lbDetail.Attributes["reqid"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "request_id"));
            }
        }
        protected ArrayList GetCheckedItems(ListView lv)
        {
            ArrayList a = new ArrayList();
            foreach (ListViewItem item in lv.Items)
            {
                CheckBox chk = (CheckBox)item.FindControl("chkItem");
                if (chk != null)
                {
                    if (chk.Checked)
                    {
                        a.Add(Convert.ToInt32(chk.Attributes["chkid"]));
                    }
                }
            }
            return a;
        }
        protected void DeleteUpdate_Click(object sender, EventArgs e)
        {
            // delete
            int uid = Convert.ToInt32(Session["uid"]);
            ArrayList a = GetCheckedItems(ListView2);
            if (a.Count > 0)
            {
                CMRCode.DeleteNodeUpdate(uid, a);
                ListView2.DataBind();
            }
        }
        protected void CommitUpdate_Click(object sender, EventArgs e)
        {
            // update
            int uid = Convert.ToInt32(Session["uid"]);
            ArrayList a = GetCheckedItems(ListView2);
            if (a.Count > 0)
            {
                CMRCode.CommitNodeUpdate(uid, a);
                ListView2.DataBind();
            }
        }

        protected void CommitInsert_Click(object sender, EventArgs e)
        {
            // update
            int uid = Convert.ToInt32(Session["uid"]);
            ArrayList a = GetCheckedItems(ListView1);
            if (a.Count > 0)
            {
                CMRCode.CommitNodeInsert(uid, a);
                ListView1.DataBind();
            }
        }
        protected void DeleteInsert_Click(object sender, EventArgs e)
        {
            // delete
            int uid = Convert.ToInt32(Session["uid"]);
            ArrayList a = GetCheckedItems(ListView1);
            if (a.Count > 0)
            {
                CMRCode.DeleteNodeInsert(uid, a);
                ListView1.DataBind();
            }
        }

        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            if (ListView1.Items.Count > 0)
            {
                if (ddlStatus.SelectedValue.Equals("0"))
                {
                    HtmlGenericControl div = (HtmlGenericControl)ListView1.FindControl("divInsert");
                    if (div != null)
                        div.Visible = true;
                }
            }
        }
        protected void ListView2_DataBound(object sender, EventArgs e)
        {
            if (ListView2.Items.Count > 0)
            {
                if (ddlStatus.SelectedValue.Equals("0"))
                {
                    HtmlGenericControl div = (HtmlGenericControl)ListView2.FindControl("divUpdate");
                    if (div != null)
                        div.Visible = true;
                }
                LinkButton lnkDeleteUpdate = (LinkButton)ListView2.FindControl("lnkDeleteUpdate");
                LinkButton lnkCommitUpdate = (LinkButton)ListView2.FindControl("lnkCommitUpdate");
                if (gid == 1)
                {
                    lnkDeleteUpdate.Visible = true;
                    lnkCommitUpdate.Visible = true;
                }
                else
                {
                    lnkDeleteUpdate.Visible = false;
                    lnkCommitUpdate.Visible = false;
                }
            }
        }
        protected void ddlRA_DataBound(object sender, EventArgs e)
        {
            ddlRA.Items.Insert(0, new ListItem("ทุกหน่วยงาน", "0"));
        }
        protected void SendRequest_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int reqid = Convert.ToInt32(lb.Attributes["reqid"]);
            CMRCode.CommitNodeInsert(reqid, uid);
            ListView1.DataBind();
        }
    }
}