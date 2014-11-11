using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OIDReg
{
    public partial class request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int matched = 0;
            if (!IsPostBack)
            {
                string u = "guest";
                string p = "1234";
                string ip = Request.ServerVariables["REMOTE_ADDR"];
                int uid = CMRCode.Login(u, p, ip);

                string id = Request.QueryString["id"];
                if (!(id == null || id == string.Empty))
                {
                    matched = LoadRequest(id);
                }
                if (matched < 1)
                {
                    Response.Redirect("invalidreq.aspx");
                }
            }

            
        }
        private int LoadRequest(string id)
        {
            DataTable dt = CMRCode.GetRequestByKey(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                hidRegID.Value = Convert.ToString(dr["reg_id"]);
                txtNameTh.Text = Convert.ToString(dr["app_name_th"]);
                txtNameEn.Text = Convert.ToString(dr["app_name_en"]);
                txtEmail.Text = Convert.ToString(dr["app_email"]);
                //txtPhone.Text = Convert.ToString(dr["app_phone"]);
                txtOrgNameTh.Text = Convert.ToString(dr["org_name_th"]);
                txtOrgNameEn.Text = Convert.ToString(dr["org_name_en"]);
                txtMinistry.Text = Convert.ToString(dr["org_ministry"]);
                txtOrgEmail.Text = Convert.ToString(dr["org_email"]);
                txtOrgPhone.Text = Convert.ToString(dr["org_phone"]);
                txtOrgFax.Text = Convert.ToString(dr["org_fax"]);
                txtWebSite.Text = Convert.ToString(dr["org_website"]);
                txtOrgAddress.Text = Convert.ToString(dr["org_address"]);

                txtContactName1.Text = Convert.ToString(dr["contact_name_th"]);
                txtContactName2.Text = Convert.ToString(dr["contact_name_en"]);
                txtContactPhone.Text = Convert.ToString(dr["contact_phone"]);
                txtContactEmail.Text = Convert.ToString(dr["contact_email"]);
                

                txtOIDSecondary.Text = Convert.ToString(dr["oid_request_secondary"]); ;
                txtUnicodeLabel.Text = Convert.ToString(dr["oid_request_nonint_label"]); ;
                txtInformation.Text = Convert.ToString(dr["oid_request_info"]);
                txtDesc.Text = Convert.ToString(dr["oid_request_desc"]);
                int parent = Convert.ToInt32(dr["oid_request_parent"]);
                                 
                //ddlroot.Items.FindByValue(parent.ToString()).Selected = true;
                ddlroot.SelectedValue = parent.ToString() ;
                return 1;
            }
            return 0;
        }
        private int CheckEmptyFields(TextBox t, Label l)
        {
            if (t.Text.Trim() == string.Empty)
            {
                l.Text = " กรุณากรอกข้อมูล ";
                return 1;
            }
            return 0;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            int ec = 0;
            try
            {
                OIDRequest req = new OIDRequest();

                req.nameTh = txtNameTh.Text.Trim();
                req.nameEn = txtNameEn.Text.Trim();
                req.email = txtEmail.Text.Trim();
                req.phone = txtContactPhone.Text.Trim();

                req.contactNameTh = txtContactName1.Text.Trim();
                req.contactNameEn = txtContactName2.Text.Trim();
                req.contactPhone = txtContactPhone.Text.Trim();
                req.contactEmail = txtContactEmail.Text.Trim();
                req.contactAddress = "";
                
                req.orgNameTh = txtOrgNameTh.Text.Trim();
                req.orgNameEn = txtOrgNameEn.Text.Trim();
                req.orgMinistry = txtMinistry.Text.Trim();
                req.orgEmail = txtOrgEmail.Text.Trim();
                req.orgWebSite = txtWebSite.Text.Trim();
                req.orgPhone = txtOrgPhone.Text.Trim();
                req.orgFax = txtOrgFax.Text.Trim();
                req.orgAddress = txtOrgAddress.Text.Trim();

                req.oidSecondary = txtOIDSecondary.Text.Trim();
                req.oidUnicodeLabel = txtUnicodeLabel.Text.Trim();
                req.oidInformation = txtInformation.Text.Trim();
                req.oidDescription = txtDesc.Text.Trim();

                req.parent = Convert.ToInt32(ddlroot.SelectedValue.ToString());

                //ส่วนที่ 1 : ข้อมูลผู้ยื่นคำร้อง 
                if (CheckEmptyFields(txtNameTh, lblNameTh) == 1)
                {
                    ec++;
                    lblNameTh.Text = "กรุณากรอกข้อมูล";
                }
                else if (CMRCode.CheckThai(txtNameTh.Text.Trim()) == false)
                {
                    ec++;
                    lblNameTh.Text = "กรุณากรอกข้อมูลภาษาไทย";
                }
                else
                {

                    lblNameTh.Text = "";
                }

                if (CheckEmptyFields(txtNameEn, lblNameEn) == 1)
                {
                    ec++;
                    lblNameEn.Text = "กรุณากรอกข้อมูล";
                }
                else if (CMRCode.CheckEng(txtNameEn.Text.Trim()) == false)
                {
                    ec++;
                    lblNameEn.Text = "กรุณากรอกข้อมูลภาษาอังกฤษ";
                }
                else
                {
                    lblNameEn.Text = "";
                }
                if (req.email.Trim() == string.Empty)
                {
                    ec++;
                    lblEmail.Text = "กรุณากรอกข้อมูล";
                }
                else if (req.email.Trim() != string.Empty && (!CMRCode.CheckEmail(req.email)))
                {
                    ec++;
                    lblEmail.Text = "กรุณากรอก email ที่ถูกต้อง";
                }
                else
                {
                    lblEmail.Text = "";
                }

                if (CMRCode.CheckPhone(txtContactPhone.Text.Trim()) == false)
                {
                    if (CMRCode.CheckMobile(txtContactPhone.Text.Trim()) == false)
                    {
                        ec++;
                        lblContactPhone.Text = "กรุณาเบอร์โทรศัพท์ที่ถูกต้อง";
                    }
                    else
                    {
                        lblContactPhone.Text = "";
                    }
                }
                else
                {
                    lblContactPhone.Text = "";
                }

                //ส่วนที่ 2 : ข้อมูลองค์กร
                if (CheckEmptyFields(txtOrgNameTh, lblOrgName1) == 1)
                {
                    ec++;
                    lblOrgName1.Text = "กรุณากรอกข้อมูล";
                }
                else if (CMRCode.CheckThai(txtOrgNameTh.Text.Trim()) == false)
                {
                    ec++;
                    lblOrgName1.Text = "กรุณากรอกข้อมูลภาษาไทย";
                }
                else
                {

                    lblOrgName1.Text = "";
                }

                if (CheckEmptyFields(txtOrgNameEn, lblOrgName2) == 1)
                {
                    ec++;
                    lblOrgName2.Text = "กรุณากรอกข้อมูล";
                }
                else if (CMRCode.CheckEng(txtOrgNameEn.Text.Trim()) == false)
                {
                    ec++;
                    lblOrgName2.Text = "กรุณากรอกข้อมูลภาษาอังกฤษ";
                }
                else
                {

                    lblOrgName2.Text = "";
                }

                if (req.orgEmail != string.Empty && (!CMRCode.CheckEmail(req.orgEmail)))
                {
                    ec++;
                    lblOrgEmail.Text = "กรุณากรอก email ที่ถูกต้อง";
                }
                if (req.contactEmail != string.Empty && (!CMRCode.CheckEmail(req.contactEmail)))
                {
                    ec++;
                    lblContactEmail.Text = "กรุณากรอก email ที่ถูกต้อง";
                }

                //ส่วนที่ 3 ข้อมูลของผู้ติดต่อ
                if (CheckEmptyFields(txtContactName1, lblContactName1) == 1)
                {
                    ec++;
                    lblContactName1.Text = "กรุณากรอกข้อมูล";
                }
                else if (CMRCode.CheckThai(txtContactName1.Text.Trim()) == false)
                {
                    ec++;
                    lblContactName1.Text = "กรุณากรอกข้อมูลภาษาไทย";
                }
                else
                {

                    lblContactName1.Text = "";
                }

                if (CheckEmptyFields(txtContactName2, lblContactName2) == 1)
                {
                    ec++;
                    lblContactName2.Text = "กรุณากรอกข้อมูล";
                }
                else if (CMRCode.CheckEng(txtContactName2.Text.Trim()) == false)
                {
                    ec++;
                    lblContactName2.Text = "กรุณากรอกข้อมูลภาษาอังกฤษ";
                }
                else
                {
                    lblContactName2.Text = "";
                }


                if (ec > 0)
                {
                    lblError.Text = "กรุณาตรวจสอบข้อมูลใหม่อีกครั้ง";
                    return;
                }

                req.parent = Convert.ToInt32(ddlroot.SelectedValue);

                if (req.parent == -1)
                {
                    lblRoot.Text = "กรุณาเลือกข้อมูลกิ่งที่ต้องการลงทะเบียน";
                    return;
                }
                if (CMRCode.NodeCheckSecondary(req.oidSecondary) > 0)
                {
                    sb.Append("ข้อมูล [secondary] ไม่ถูกต้องตามมาตรฐานที่กำหนด");
                    throw new Exception(sb.ToString());
                }

                if (CMRCode.NodeCheckULabel(req.oidUnicodeLabel) > 0)
                {
                    sb.Append("ข้อมูล [secondary] ไม่ถูกต้องตามมาตรฐานที่กำหนด");
                    throw new Exception(sb.ToString());
                }

                int oidcheck = CMRCode.CheckOIDEntry(req.parent, req.oidSecondary, req.oidUnicodeLabel);
                if (oidcheck > 0)
                {
                    sb.Append("ข้อมูล OID ซ้ำ - กรุณาระบุใหม่, ");
                    if ((oidcheck & 2) == 2)
                        sb.Append(" [secondary]");

                    if ((oidcheck & 4) == 4)
                        sb.Append(" [unicode label]");

                    throw new Exception(sb.ToString());
                }


                string id = hidRegID.Value;
                CMRCode.UpdateRequest(Convert.ToInt32(id),req);

                Session["reqid"] = id;
                Session["parent"] = CMRCode.GetParent(req.parent);
                    

                Response.Redirect("document.aspx");               
                //Response.Redirect("received.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }    
        }
    }
}