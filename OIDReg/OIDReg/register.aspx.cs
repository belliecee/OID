using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace OIDReg
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        //private int CheckThai(TextBox t)
        //{
        //    bool isThai = true; 
        //    byte[] ASCIIValues =  Encoding.ASCII.GetBytes(t.Text.ToString());
        //    if (t.Text.Length > 0)
        //    {
             
        //        foreach (byte b in ASCIIValues)
        //        {
        //            if (b == 32 || b == 63)//ภาษาไทย
        //            {
        //                if (isThai == true)
        //                {
        //                    isThai = true;
        //                }
        //            }
        //            else
        //            {
        //                isThai = false;
        //            }
        //        }
        //        if (isThai == false)
        //        {
        //            return 1;
        //        }
        //        return 0;
        //    }
        //    return 1;
        //}
        //private int CheckEng(TextBox t)
        //{
        //    bool isEng = true;
        //    byte[] ASCIIValues = Encoding.ASCII.GetBytes(t.Text.ToString());
        //    if (t.Text.Length > 0)
        //    {
        //        foreach (byte b in ASCIIValues)
        //        {
        //            if (b != 32)
        //            {
        //                if (b >= 65 && b <= 90)//ภาษาอังกฤษ
        //                {
        //                    if (isEng == true)
        //                    {
        //                        isEng = true;
        //                    }
        //                }
        //                else if (b >= 97 && b <= 122)//ภาษาอังกฤษ
        //                {
        //                    if (isEng == true)
        //                    {
        //                        isEng = true;
        //                    }
        //                }
        //                else
        //                {
        //                    isEng = false;
        //                }
        //            }                    
        //        }
        //        if (isEng == false)
        //        {
        //            return 1;
        //        }
        //        return 0;
        //    }
        //    return 1;

        //}
        private void ResetFieldsValidate()
        {
            lblOrgName1.Text = "*";
            lblOrgName2.Text = "*";
            lblOrgEmail.Text = "*";

            lblOrgName1.Text = "*";
            lblOrgName2.Text = "*";
            lblOrgEmail.Text = "*";
            lblOrgPhone.Text = "*";
            lblOrgAddress.Text = "*";

            lblContactName1.Text = "*";
            lblContactName2.Text = "*";
            lblContactEmail.Text = "*";
            lblContactPhone.Text = "*";
            

            lblOIDSecondary.Text = "*";
            lblUnicodeLabel.Text = "*";
            lblDescription.Text = "*";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ResetFieldsValidate();

            int ec = 0;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();            
            try
            {
                ec += CheckEmptyFields(txtName1, lblNameTh);
                ec += CheckEmptyFields(txtNameEn, lblNameEn);
                ec += CheckEmptyFields(txtEmail, lblEmail);

                ec += CheckEmptyFields(txtOrgNameTh, lblOrgName1);
                ec += CheckEmptyFields(txtOrgNameEn, lblOrgName2);
                ec += CheckEmptyFields(txtOrgEmail, lblOrgEmail);
                ec += CheckEmptyFields(txtOrgPhone, lblOrgPhone);
                ec += CheckEmptyFields(txtOrgAddress, lblOrgAddress);

                ec += CheckEmptyFields(txtContactName1, lblContactName1);
                ec += CheckEmptyFields(txtContactName2, lblContactName2);
                ec += CheckEmptyFields(txtContactEmail, lblContactEmail);
                ec += CheckEmptyFields(txtContactPhone, lblContactPhone);
                

                ec += CheckEmptyFields(txtOIDSecondary, lblOIDSecondary);
                ec += CheckEmptyFields(txtUnicodeLabel, lblUnicodeLabel);
                ec += CheckEmptyFields(txtDesc, lblDescription);

                OIDRequest req = new OIDRequest();
                
                req.nameTh = txtName1.Text.Trim();
                req.nameEn = txtNameEn.Text.Trim();
                req.email = txtEmail.Text.Trim();
                
                req.contactNameTh = txtContactName1.Text.Trim();
                req.contactNameEn = txtContactName2.Text.Trim();
                req.contactEmail = txtContactEmail.Text.Trim();
                req.contactPhone = txtContactPhone.Text.Trim();
                


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
                req.oidDescription = txtDesc.Text.Trim();
                req.oidInformation = txtInformation.Text.Trim();
                
                //ส่วนที่ 1 : ข้อมูลผู้ยื่นคำร้อง 
                if (CheckEmptyFields(txtName1, lblNameTh) == 1)
                {
                    ec++;
                    lblNameTh.Text = "กรุณากรอกข้อมูล";
                }
                else if (CMRCode.CheckThai(txtName1.Text.Trim()) == false)
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
                else if (req.email.Trim()  != string.Empty && (!CMRCode.CheckEmail(req.email)))
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
                else if (CMRCode.CheckThai(txtContactName1.Text.Trim() ) == false)
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
                    lblRoot.Text = "กรุณาเลือกกิ่งที่ลงทะเบียน";
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

                bool isduplicateinfo = CMRCode.CheckDuplicateOIDInfo(req);
                if (isduplicateinfo == true)
                {
                    sb.Append("ข้อมูลคำขอ OID ซ้ำ - กรุณาระบุใหม่, ");
                    if ((oidcheck & 2) == 2)
                        sb.Append(" [secondary]");

                    if ((oidcheck & 4) == 4)
                        sb.Append(" [unicode label]");

                    throw new Exception(sb.ToString());
                }

                int reqid = CMRCode.SubmitRequest(req);
                Session["reqid"] = reqid.ToString();
                Session["parent"] = CMRCode.GetParent(req.parent);
                
                Response.Redirect("document.aspx");
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;

            }            
        }

       
    }
}