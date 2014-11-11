using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI.HtmlControls;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data.SqlClient;
using System.IO;

namespace OIDReg
{
    public partial class summary : System.Web.UI.Page
    {
        int item_no = 0;
        int total_sub = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int uid = Convert.ToInt32(Session["uid"]);
                LoadInfo(uid);
            }
            //DataTable nodesum = new DataTable();
            //nodesum = CMRCode.GetNodeSummary(1);
            //int nodesumNum = nodesum.Rows.Count;

            ////DataTable nodesumSess;
            //Session["nodesum"] = nodesum;

            ////Label1.Text = nodesum.Rows.Count.ToString();
            //HiddenField1.Value = Convert.ToString(1); ; //nodesumNum.ToString();
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
        protected void LoadInfo(int uid)
        {
            DataTable dt = CMRCode.GetUserInfo(uid);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];

                HiddenField1.Value = Convert.ToString(dr["node_id"]);
                lbOrgName.Text = GetStringField(dr["org_name_th"]);
                secondId.Text  = Convert.ToString(dr["secondary_id"]);


                Session["rootid"] = dr["node_id"];
                Session["orgname"] = "สรุปหมายเลข OID ภายใต้ " + GetStringField(dr["org_name_th"]) + " (" + Convert.ToString(dr["secondary_id"])+")";
                
            }
        }
        private void genPDFReport()
        {
            BaseFont fntTHSarabun = BaseFont.CreateFont(Server.MapPath("~/fonts/THSarabun.ttf"), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);


            // FONT STYLE
            Font fntTableFontHdr = new Font(fntTHSarabun, 11, iTextSharp.text.Font.BOLD, BaseColor.BLACK);
            Font fntTableFont = new Font(fntTHSarabun, 11, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
            Font headerFont = new Font(fntTHSarabun, 16, iTextSharp.text.Font.BOLD, BaseColor.BLACK);

            string strReportName = "OIDReportPdf" + DateTime.Now.Ticks + ".pdf";
            Document doc = new Document(iTextSharp.text.PageSize.LETTER, 5, 10, 20, 20);
            // Set Page margin
            doc.SetMargins(30f, 30f, 40f, 40f);
            string pdfFilePath = Server.MapPath("~") + "\\Reports\\";
// Add ETDA Image
            string imagepath = Server.MapPath("~") + "\\images\\";
            iTextSharp.text.Image etdaImg = iTextSharp.text.Image.GetInstance(imagepath + "/etdalogo.png");
            //Resize image depend upon your need
            etdaImg.ScaleToFit(100f, 80f);
            etdaImg.SpacingBefore = 10f;
            etdaImg.Alignment = Element.ALIGN_LEFT;
// End of Add ETDA Image
            PdfWriter wri = PdfWriter.GetInstance(doc, new FileStream(pdfFilePath + strReportName, FileMode.Create));
            doc.Open();
            int tableColumnNum = 5;
            string titledate = "  วันที่ " + System.DateTime.Now.ToString("dd MMMM yyyy");
            string pdftitle = Session["orgname"] + titledate;
            // Set PDF Header
            Paragraph heading = new Paragraph(pdftitle, headerFont);
            heading.SpacingAfter = 20f;
            //heading.SetAlignment("center");
            
            doc.Add(etdaImg);
            doc.Add(heading);

            //Creating Table
            PdfPTable myTable = new PdfPTable(tableColumnNum);
            // Table size is set to 100% of the page
            myTable.WidthPercentage = 100;
            //Left aLign
            myTable.HorizontalAlignment = 0;
            myTable.SpacingAfter = 10;
            float[] sglTblHdWidths = new float[tableColumnNum];
            sglTblHdWidths[0] = 50f;
            sglTblHdWidths[1] = 100f;
            sglTblHdWidths[2] = 250f;
            sglTblHdWidths[3] = 200f;
            sglTblHdWidths[4] = 100f;
            // Set the column widths on table creation. Unlike HTML cells cannot be sized.
            myTable.SetWidths(sglTblHdWidths);
            PdfPCell CellOneHdr = new PdfPCell(new Phrase("ลำดับ", fntTableFontHdr));
            myTable.AddCell(CellOneHdr);
            PdfPCell CellTwoHdr = new PdfPCell(new Phrase("หมายเลขโอไอดี", fntTableFontHdr));
            myTable.AddCell(CellTwoHdr);
            PdfPCell CellTreeHdr = new PdfPCell(new Phrase("หน่วยงาน", fntTableFontHdr));
            myTable.AddCell(CellTreeHdr);
            PdfPCell CellFourHdr = new PdfPCell(new Phrase("ชื่อกิ่งหลัก", fntTableFontHdr));
            myTable.AddCell(CellFourHdr);
            PdfPCell CellFiveHdr = new PdfPCell(new Phrase("จำนวนรายการ", fntTableFontHdr));
            myTable.AddCell(CellFiveHdr);
            //PdfPCell CellFiveHdr = new PdfPCell(new Phrase("cell 5 Hdr", fntTableFontHdr));
            //myTable.AddCell(CellFiveHdr);
            // End of Table Header
            string ConnectionString = ConfigurationManager.ConnectionStrings["LocalDatabase"].ConnectionString;
            SqlConnection conn = new SqlConnection(ConnectionString);
            try
            {
                conn.Open();
                string sql = "query_node_summary";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                cmd.Parameters.Add(new SqlParameter("@root_id", SqlDbType.Int));
                cmd.Parameters[0].Value = Session["rootid"];
                DataTable dt = new DataTable();
                da.Fill(dt);
                int ndt = dt.Rows.Count;

                string dotNotation;
                string originalName;
                string secondaryId;
                int tempSubOrdinate;
                string subOrdinate;

                int nodesummation = 0;
                for (int i = 0; i < ndt; i++)
                {
                    DataRow dr = dt.Rows[i];
                    dotNotation = Convert.ToString(dr["dot_notation"]);
                    originalName = Convert.ToString(dr["org_name_th"]);
                    secondaryId = Convert.ToString(dr["secondary_id"]);
                    tempSubOrdinate = Convert.ToInt32(dr["sub_ordinate"]);
                    subOrdinate = tempSubOrdinate.ToString();

                    nodesummation = nodesummation + tempSubOrdinate;

                    myTable.AddCell(new PdfPCell(new Phrase((i + 1).ToString(), fntTableFont)));
                    myTable.AddCell(new PdfPCell(new Phrase(dotNotation, fntTableFont)));
                    myTable.AddCell(new PdfPCell(new Phrase(originalName, fntTableFont)));
                    myTable.AddCell(new PdfPCell(new Phrase(secondaryId, fntTableFont)));
                    myTable.AddCell(new PdfPCell(new Phrase(subOrdinate, fntTableFont)));

                }
                // Total Cell Colspan

                PdfPCell totalcell = new PdfPCell(new Phrase("รวมทั้งสิ้น", fntTableFont));
                totalcell.Colspan = 4;
                totalcell.HorizontalAlignment = 2; //0=Left, 1=Centre, 2=Right
                myTable.AddCell(totalcell);
                myTable.AddCell(new PdfPCell(new Phrase(nodesummation.ToString(), fntTableFont)));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }



            doc.Add(myTable);
            doc.Close();


            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + strReportName);
            Response.TransmitFile(Server.MapPath("~/Reports/" + strReportName));
            Response.End();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            // Parameters 
            int rootID = Convert.ToInt32(Session["rootid"]);
            genPDFReport();
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

                int sub_count = Convert.ToInt32(DataBinder.Eval(dataItem.DataItem, "sub_ordinate"));
                total_sub += sub_count;
            }
        }
        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            Label lbl = (Label)ListView1.FindControl("lblTotal");
            lbl.Text = total_sub.ToString();
        }
    }

    
}