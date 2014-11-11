using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

namespace OIDReg.Manage
{
    public partial class loadoid : System.Web.UI.Page
    {
        OleDbConnection oledbConn;
        int uid = 0;
        int error_count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["batchfile"] = "";
                Button2.Enabled = false;
                Button2.Style["background-color"] = "#cccccc";
            }
            uid = Convert.ToInt32(Session["uid"]);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    Button2.Enabled = false;
                    Button2.Style["background-color"] = "#cccccc";

                    //string filename = Path.GetFileName(FileUploadControl.FileName);
                    string fileExt = Path.GetExtension(FileUploadControl.FileName);
                    //FileUploadControl.SaveAs(Server.MapPath("~/BulkOID/") + filename);
                    string filename = "OIDBulk_" + DateTime.Now.Ticks + fileExt;
                    string file = Server.MapPath("~/App_Data/") + filename;
                    FileUploadControl.SaveAs(file);
                    
                    //lblError.Text = "Upload status: File uploaded!";
                    LoadFile(file);
                    //System.IO.File.Delete(file);
                    
                }
                catch (Exception ex)
                {
                    lblError.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }

        }
        private void LoadFile(string fn)
        {
            //string path = System.IO.Path.GetFullPath(Server.MapPath("~/BulkOID/" + fn));
            string path = fn;
            lblError.Text = path;
            // Variable filetype indicate type of the imported fies. Default is 0. 
            //when 0, the imported file is xls or xlsx.  When 1, the imported file is  
            int filetype = 0;
            XmlReader xmlFile;
          
                // need to pass relative path after deploying on server
                //string path = System.IO.Path.GetFullPath(Server.MapPath("~/InformationNew.xlsx"));

                /* connection string  to work with excel file. HDR=Yes - indicates 
                    that the first row contains columnnames, not data. HDR=No - indicates 
                    the opposite. "IMEX=1;" tells the driver to always read "intermixed" 
                    (numbers, dates, strings etc) data columns as text. 
                Note that this option might affect excel sheet write access negative. */
                DataSet ds = new DataSet();

                if (Path.GetExtension(path) == ".xls")
                {
                    oledbConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"");
                    filetype = 0; 
                }
                else if (Path.GetExtension(path) == ".xlsx")
                {
                    oledbConn = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties='Excel 12.0;HDR=YES;IMEX=1;';");
                    filetype = 0; 
                }         
                else if (Path.GetExtension(path) == ".xml")
                {
                    //Label1.Text = "Hello XML";
                    
                    //ds.ReadXml(reader);
                    filetype = 1; 

                }
                if (filetype == 0)
                {
                    try
                    {
                        oledbConn.Open();
                        OleDbCommand cmd = new OleDbCommand();
                        OleDbDataAdapter oleda = new OleDbDataAdapter();


                        cmd.Connection = oledbConn;
                        cmd.CommandType = CommandType.Text;

                        cmd.CommandText = "SELECT * FROM [Sheet1$]";
                        oleda = new OleDbDataAdapter(cmd);
                        oleda.Fill(ds);
                        string file_id = Guid.NewGuid().ToString();
                        int root = Convert.ToInt32(Session["root"]);
                        CMRCode.LoadRequest(uid, file_id, ds.Tables[0]);
                        CMRCode.CompileRequest(root, file_id);

                        Session["batchfile"] = file_id;

                        ListView1.DataSource = CMRCode.GetRequest(1, file_id);
                        ListView1.DataBind();

                        divImport.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        //lblError.Text = ex.ToString();
                        lblError.Text = "Loading Failed : " + ex.Message;
                    }
                    finally
                    {
                        oledbConn.Close();
                    }

                }
                else
                {
                    try{
                        XmlReader xmlread = XmlReader.Create(path, new XmlReaderSettings());
                        ds.ReadXml(xmlread);
                        string file_id = Guid.NewGuid().ToString();
                        int root = Convert.ToInt32(Session["root"]);
                        CMRCode.LoadRequest(uid, file_id, ds.Tables[0]);
                        CMRCode.CompileRequest(root, file_id);
                        Session["batchfile"] = file_id;

                            ListView1.DataSource = CMRCode.GetRequest(1, file_id);
                            ListView1.DataBind();

                            divImport.Visible = true;
                            xmlread.Close();
                    }
                    catch (Exception ex)
                    {
                        //lblError.Text = ex.ToString();
                        lblError.Text = "Loading Failed : " + ex.Message;
                    }
                    //int i = 0;
                    //for (i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                    //{
                       
                    //    Label1.Text = Label1.Text + "\n" + ds.Tables[0].Rows[i].ItemArray[0].ToString();
                    //} 
                }
                
//----------------------------------------------------------------------------
                
                //string file_id = Guid.NewGuid().ToString();
                //int root = Convert.ToInt32(Session["root"]);
                //CMRCode.LoadRequest(uid, file_id, ds.Tables[0]);               
                //CMRCode.CompileRequest(root, file_id);

                //Session["batchfile"] = file_id;
                
                //ListView1.DataSource = CMRCode.GetRequest(1, file_id);
                //ListView1.DataBind();

                //divImport.Visible = true;
            
            // need to catch possible exceptions
            

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int raid = Convert.ToInt32(Session["raid"]);
            string file_id = Convert.ToString(Session["batchfile"]);
            if (file_id != string.Empty)
            {
                CMRCode.CreateNode(file_id, raid);
                Response.Redirect("oidchanged.aspx");
            }
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = e.Item;
            if (item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                HtmlTableCell td = (HtmlTableCell)item.FindControl("td_status");
                if (td != null)
                {
                    int status = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "item_status"));

                    if (status == 0)
                    {
                        td.InnerHtml = "ผ่าน";
                    }
                    else
                    {
                        error_count = error_count + 1;
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        if ((status & 1) == 1)
                        {
                            sb.Append(" / กิ่งต้นทางไม่มีอยู่จริง");
                        }
                        if ((status & 2) == 2)
                        {
                            sb.Append(" / หมายเลขโอไอดีไม่ตรงกับ integer unicode label");
                        }
                        if ((status & 8) == 8)
                        {
                            sb.Append(" / หมายเลขโอไอดีซ้ำภายใต้กิ่งเดียวกัน");
                        }
                        if ((status & 16) == 16)
                        {
                            sb.Append(" / secondary id ซ้ำในกิ่งต้นทางเดียวกัน");
                        }
                        if ((status & 32) == 32)
                        {
                            sb.Append(" / unicode label ซ้ำในกิ่งต้นทางเดียวกัน");
                        }
                        if ((status & 64) == 64)
                        {
                            sb.Append(" / ชื่อ secondary id ไม่ถูกต้องตามมาตรฐาน");
                        }
                        if ((status & 128) == 128)
                        {
                            sb.Append(" / ชื่อ unicode label ไม่ถูกต้องตามมาตรฐาน");
                        }
                        if ((status & 256) == 256)
                        {
                            sb.Append(" / มีหมายเลขโอไอดี ชื่อ secondary_id หรือ unicode_label ซ้ำกันภายใต้กิ่งเดียวกัน");
                        }

                        td.InnerHtml = sb.ToString();
                        td.Style["color"] = "#990000";
                    }
                }
            } // end if (td != null)
        }

        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            if (error_count == 0)
            {
                Button2.Enabled = true;
                Button2.Style["background-color"] = "#A6CD56";
            }
        }

     }
}