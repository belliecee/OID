using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class request : System.Web.UI.Page
{
    protected int file_no = 0;
    protected string FileURL
    {
        get { return Convert.ToString(ViewState["fileurl"]); }
        set { ViewState["fileurl"] = value; }
    }
    protected int uid;
    protected int gid;
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Convert.ToInt32(Session["uid"]);
        gid = Convert.ToInt32(Session["gid"]);

        divApprove.Visible = (gid == 2 || gid == 3);
        divStaff.Visible = (gid == 1);

        if (!IsPostBack)
        {
            if (!(Request.QueryString["id"] == null || Request.QueryString["id"] == string.Empty))
            {

                int id = 0;
                try
                {
                    id = Convert.ToInt32(Request.QueryString["id"]);
                }
                catch
                {
                    id = Convert.ToInt32(CheckReqId(Request.QueryString["id"]));
                }

                LoadRequest(id);
            }
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
    private void LoadRequest(int id)
    {
        DataTable dt = CMRCode.GetRequest(id.ToString());
        if (dt.Rows.Count > 0)
        {
            FileURL = ConfigurationManager.AppSettings["WebRegister"] + "docs/";

            hidReqID.Value = id.ToString();
            DataRow dr = dt.Rows[0];
            t11.Text = GetStringField(dr["app_name_th"]);
            t12.Text = GetStringField(dr["app_name_en"]);
            t13.Text = GetStringField(dr["app_email"]);
            t14.Text = GetStringField(dr["app_phone"]);

            t21.Text = GetStringField(dr["org_name_th"]);
            t22.Text = GetStringField(dr["org_name_en"]);
            t23.Text = GetStringField(dr["org_ministry"]);
            t24.Text = GetStringField(dr["org_email"]);
            t25.Text = GetStringField(dr["org_website"]);
            t26.Text = GetStringField(dr["org_phone"]);
            t27.Text = GetStringField(dr["org_fax"]);
            t28.Text = GetStringField(dr["org_address"]);

            t31.Text = GetStringField(dr["contact_name_th"]);
            t32.Text = GetStringField(dr["contact_name_en"]);
            t33.Text = GetStringField(dr["contact_email"]);
            t34.Text = GetStringField(dr["contact_phone"]);


            lblID.Text = Convert.ToString(dr["reg_id"]);
            lblDate.Text = Convert.ToDateTime(dr["reg_created_date"]).ToString("dd-MM-yyyy hh:mmtt");
            lblStatus.Text = Convert.ToString(dr["status_caption"]);

            int pid = Convert.ToInt32(dr["oid_request_parent"]);
            hidParentID.Value = pid.ToString();
            DataTable dt2 = CMRCode.GetNode(pid);
            lblParentNode.Text = "<b>" + Convert.ToString(dt2.Rows[0]["secondary_id"]) + " (" + Convert.ToString(dt2.Rows[0]["primary_int"]) + ") </b>" +
                "<br>" + Convert.ToString(dt2.Rows[0]["notation1"]) + " " + Convert.ToString(dt2.Rows[0]["secondary_id"]) + " (" + Convert.ToString(dt2.Rows[0]["primary_int"]) + ")" +
                "<br>" + Convert.ToString(dt2.Rows[0]["notation2"]) + "." + Convert.ToString(dt2.Rows[0]["primary_int"]);

            t40.Text = GetStringField(dr["reg_assign_oid_no"]);
            t41.Text = GetStringField(dr["oid_request_secondary"]);
            t42.Text = GetStringField(dr["oid_request_nonint_label"]);
            t43.Text = GetStringField(dr["oid_request_info"]);
            t44.Text = GetStringField(dr["oid_request_desc"]);


            uid = Convert.ToInt32(Session["uid"]);
            gid = Convert.ToInt32(Session["gid"]);
            int status = Convert.ToInt32(dr["reg_status"]);

            if (divStaff.Visible)
            {
                // for gid=1 only
                t40.Enabled = true;
                t40.ReadOnly = false;

                btnForward.Enabled = (status == 10);
                btnDecline.Enabled = (status == 10 || status == 22 || status == 32);
                btnCancel.Enabled = (status == 10 || status == 11 || status == 22 || status == 32);
                btnFinal.Enabled = (status == 31);
                btnDelete.Enabled = (status == 12);

                if (!btnForward.Enabled) btnForward.Style["background-color"] = "#cccccc";
                if (!btnDecline.Enabled) btnDecline.Style["background-color"] = "#cccccc";
                if (!btnCancel.Enabled) btnCancel.Style["background-color"] = "#cccccc";
                if (!btnFinal.Enabled) btnFinal.Style["background-color"] = "#cccccc";
                if (!btnDelete.Enabled) btnDelete.Style["background-color"] = "#cccccc";
            }

            if (divApprove.Visible)
            {
                btnApprove.Enabled = ((status == 20 && gid == 2) || (status == 30 && gid == 3));
                btnReject.Enabled = btnApprove.Enabled;

                if (!btnApprove.Enabled) btnApprove.Style["background-color"] = "#cccccc";
                if (!btnReject.Enabled) btnReject.Style["background-color"] = "#cccccc";
            }
        }
    }
    private string CheckReqId(string id)
    {
        string reqId = "0";
        DataTable dt = CMRCode.GetRequestByKey(id.ToString());
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            reqId = Convert.ToString(dr["reg_id"]);
        }
        return reqId;
    }
    protected void Forward_Click(object sender, EventArgs e)
    {
        string tid = t40.Text.Trim();
        int id = 0;
        try
        {
            id = Convert.ToInt32(tid);
        }
        catch
        {
            lblError.Text = "หมายเลข OID ไม่ได้ถูกกำหนด";
            return;
        }

        int pid = Convert.ToInt32(hidParentID.Value);
        if (CMRCode.CheckOIDInt(id, pid) > 0)
        {
            lblError.Text = "หมายเลข OID " + id + " มีการใช้งานแล้ว";
            return;
        }

        int reqid = Convert.ToInt32(hidReqID.Value);
        int uid = Convert.ToInt32(Session["uid"]);
        string remark = txtRemark.Text.Trim();
        CMRCode.AssignOID(reqid, id);
        CMRCode.UpdateStatus(reqid, uid, -1, remark, 20);
        Response.Redirect("requests.aspx");
        //Response.Redirect("request.aspx?id=" + reqid);
    }
    protected void Decline_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hidReqID.Value);
        int uid = Convert.ToInt32(Session["uid"]);
        string remark = txtRemark.Text.Trim();
        int rejectid = Convert.ToInt32(ddlReject.SelectedValue);
        if (rejectid == 0)
        {
            if (remark == string.Empty)
            {
                lblError.Text = "กรุณาระบุเหตุผลการไม่ให้ผ่านพิจารณาหรืออนุมัติ";
                return;
            }
        }
        string file_path = Server.MapPath(Path.Combine("~/App_Data/"));
        CMRCode.NotifyRequestToChange(hidReqID.Value, file_path, rejectid, remark);
        CMRCode.UpdateStatus(id, uid, rejectid, remark, 11);
        Response.Redirect("requests.aspx");
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hidReqID.Value);
        string remark = txtRemark.Text.Trim();
        int rejectid = Convert.ToInt32(ddlReject.SelectedValue);
        if (rejectid == 0)
        {
            lblError.Text = "กรุณาเลือกเหตุผลของการยกเลิกคำขอนี้";
            return;
        }
        if (remark == string.Empty)
        {
            lblError.Text = "จงระบุเหตุผลของการยกเลิกคำขอนี้อย่างละเอียด";
            return;
        }

        string file_path = Server.MapPath(Path.Combine("~/App_Data/"));
        CMRCode.NotifyReject(id, file_path, remark);
        CMRCode.UpdateStatus(id, uid, rejectid, remark, 12);
        Response.Redirect("requests.aspx");
    }
    protected void Commit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hidReqID.Value);
        int uid = Convert.ToInt32(Session["uid"]);
        string remark = txtRemark.Text.Trim();

        string file_path = Server.MapPath(Path.Combine("~/App_Data/"));
        CMRCode.FinalizeRequest(id, file_path, uid);
        CMRCode.UpdateStatus(id, uid, -1, remark, 40);
        Response.Redirect("requests.aspx");
    }
    protected void Approve_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hidReqID.Value);
        int uid = Convert.ToInt32(Session["uid"]);
        int gid = Convert.ToInt32(Session["gid"]);
        string remark = txtRemark.Text.Trim();
        if (gid == 2)
        {
            CMRCode.UpdateStatus(id, uid, -1, remark, 30);
        }
        else if (gid == 3)
        {
            CMRCode.UpdateStatus(id, uid, -1, remark, 31);
        }
        Response.Redirect("requests.aspx");
    }
    protected void Reject_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hidReqID.Value);
        int uid = Convert.ToInt32(Session["uid"]);
        int gid = Convert.ToInt32(Session["gid"]);
        string remark = txtRemark.Text.Trim();
        int rejectid = Convert.ToInt32(ddlReject.SelectedValue);
        if (rejectid == 0)
        {
            if (remark == string.Empty)
            {
                lblError.Text = "กรุณาระบุเหตุผลการไม่ให้ผ่านพิจารณาหรืออนุมัติ";
                return;
            }
        }

        if (gid == 2)
        {
            CMRCode.UpdateStatus(id, uid, rejectid, remark, 22);
        }
        else if (gid == 3)
        {
            CMRCode.UpdateStatus(id, uid, rejectid, remark, 32);
        }
        Response.Redirect("requests.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hidReqID.Value);
        CMRCode.DeleteRequest(id, uid);
        Response.Redirect("requests.aspx");
    }
    protected void ddlReject_DataBound(object sender, EventArgs e)
    {
        ddlReject.Items.Insert(0, new ListItem("กรุณาระบุเหตุผล", "0"));
    }
    protected void ListView2_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item;
        if (item.ItemType == ListViewItemType.DataItem)
        {
            HtmlTableCell td = (HtmlTableCell)item.FindControl("td_no");
            if (td != null)
            {
                file_no = file_no + 1;
                td.InnerHtml = file_no.ToString();
            }
        }
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item;
        if (item.ItemType == ListViewItemType.DataItem)
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            HtmlTableCell td = (HtmlTableCell)item.FindControl("td_detail");
            if (td != null)
            {
                int action = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "act_action_id"));
                if (action == 1002 || action == 1004 || action == 1006 || action == 1007)
                {
                    td.InnerHtml = "--" + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "reason_desc")) + " -- <br>"
                        + Convert.ToString(DataBinder.Eval(dataItem.DataItem, "act_remark"));
                }

            }
        }
    }

    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {

    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}