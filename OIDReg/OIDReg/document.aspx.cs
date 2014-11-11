using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class document : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hidRequestID.Value = Convert.ToString(Session["reqid"]);
                string parent = Convert.ToString(Session["parent"]);

                lblRoot.Text = parent;
                div1.Visible = parent.Equals("nso");
                div2.Visible = !div1.Visible;
              
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int file_count = Convert.ToInt32(hidFileCount.Value);
            if (file_count > 9)
            {
                lblError.Text = "ขออภัย เอกสารประกอบคำขอใส่มาได้ไม่เกิน 10 ไฟล์";
                return;
            }
            else
            {
                lblError.Text = "";
            }

            try
            {
                HttpPostedFile file = Request.Files["myFile"];
                //check file was submitted
                if (file != null && file.ContentLength > 0)
                {
                    int reqid = Convert.ToInt32(hidRequestID.Value);
                    int type_id = Convert.ToInt32(ddlFileType.SelectedValue);

                    string fname = Path.GetFileName(file.FileName);
                    string guid = Convert.ToBase64String(Guid.NewGuid().ToByteArray());
                    guid = guid.Replace("=", "A");
                    guid = guid.Replace("+", "B");
                    guid = guid.Replace("/", "X");


                    string new_name = reqid.ToString("00000") + "-" + guid + Path.GetExtension(fname);
                    //string path = ConfigurationManager.AppSettings["OIDFolder"] + "/temp";
                    file.SaveAs(Server.MapPath(Path.Combine("~/App_Data/temp/", new_name)));
                    //file.SaveAs(Path.Combine(path, new_name));
                    int iFileSize = file.ContentLength;
                    if (iFileSize > 10485760)  // 10MB (ห้ามเกิน 10 MB)
                    {
                        lblError.Text = "ขออภัย ขนาดไฟล์เอกสารประกอบคำขอห้ามเกิน 10 เมกกะไบต์";
                        return;
                    }
                    else
                    {
                        lblError.Text = "";
                    }
                    CMRCode.UploadDocument(reqid, type_id, fname, new_name);
                    ListView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string file_path = Server.MapPath(Path.Combine("~/App_Data/"));
            string doc_path = Server.MapPath(Path.Combine("~/docs/"));
            if (file_path.Length > 0)
            {
                CMRCode.CommitRequest(hidRequestID.Value, file_path, doc_path);
                Response.Redirect("received.aspx");
            }
        }

        protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            hidFileCount.Value = e.AffectedRows.ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int fileid = Convert.ToInt32(lb.Attributes["id"]);
            string file_path = Server.MapPath(Path.Combine("~/App_Data/temp/", Convert.ToString(lb.Attributes["filename"])));
            CMRCode.DeleteDocument( fileid, file_path);
            ListView1.DataBind();
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = e.Item;
            if (item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                int doc_id = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "doc_id"));

                LinkButton lnkDelete = (LinkButton)item.FindControl("LinkButton1");
                lnkDelete.Attributes["id"] = doc_id.ToString();
                lnkDelete.Attributes["reqid"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "doc_reqid"));
                lnkDelete.Attributes["filename"] = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "doc_file_name2"));
            }
        }
    }
}