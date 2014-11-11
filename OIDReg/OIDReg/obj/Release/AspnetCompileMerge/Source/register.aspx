<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="OIDReg.register" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <style type="text/css">
        .radio_control {
           border-width: 0px;
	       border-style: solid;
  	       border-color: #d4d4d4 #ebebeb #ebebeb #d4d4d4; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

		<div id="main">
            <div>
			    <h2>แบบคำขอลงทะเบียน</h2>		
				
			    <div  style="margin:5px 10px;">
                    <div style="font-weight:bold;">สำหรับผู้ยื่นคำร้องที่มีคุณสมบัติดังนี้</div>
                    เป็นหน่วยงานหรือเครือข่ายหน่วยงาน หรือองค์กรวิขาชีพ ที่เป็นนิติบุคคลตามกฎหมาย มีคณะบุคคลากรที่มีความสามารถ ความเชี่ยวชาญ และประสบการณ์ในงานมาตรฐานด้านธุรกรรมทางอิเล็กทรอนิกส์เฉพาะสาขารวมถึงทรัพยากรและโครงสร้างองค์กรที่มีความชัดเจนรองรับ
			    </div>
			
                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 1 ข้อมูลผู้ยื่นคำร้อง (Application Information)</div>			
			        <div style="margin-left:10px;">
                        <div>ชื่อ-นามสกุล (ภาษาไทย)</div>
                        <div><asp:TextBox ID="txtName1" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblNameTh" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ชื่อ-นามสกุล (ภาษาอังกฤษ)</div>
                        <div><asp:TextBox ID="txtNameEn" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblNameEn" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>อีเมลฺ์</div>
                        <div><asp:TextBox ID="txtEmail" runat="server" Width="300px" MaxLength="500" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblEmail" runat="server" ForeColor="red">*</asp:Label></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>		
                
                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 2 ข้อมูลขององค์กร (Organization Information)</div>			
			        <div style="margin-left:10px;">
                        <div>ชื่อหน่วยงาน (ภาษาไทย)</div>
                        <div><asp:TextBox ID="txtOrgNameTh" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgName1" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ชื่อหน่วยงาน (ภาษาอังกฤษ)</div>
                        <div><asp:TextBox ID="txtOrgNameEn" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgName2" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>สังกัด</div>
                        <div><asp:TextBox ID="txtMinistry" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox></div>
                        <div>อีเมลฺ์</div>
                        <div><asp:TextBox ID="txtOrgEmail" runat="server" Width="300px" MaxLength="500" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgEmail" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>เว็บไซต์</div>
                        <div><asp:TextBox ID="txtWebSite" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgWebsite" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>โทรศัพท์</div>
                        <div><asp:TextBox ID="txtOrgPhone" runat="server" Width="300px" MaxLength="50" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgPhone" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>โทรศัพท์</div>
                        <div><asp:TextBox ID="txtOrgFax" runat="server" Width="300px" MaxLength="50" CssClass="inputtext"></asp:TextBox></div>
                        <div>ที่ตั้ง</div>
                        <div><asp:TextBox ID="txtOrgAddress" runat="server" TextMode="MultiLine" Width="420px" Height="50px" MaxLength="1000" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgAddress" runat="server" ForeColor="red">*</asp:Label></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>	

                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 3 ข้อมูลของบุคคลติดต่อ (Contact Information)</div>			
			        <div style="margin-left:10px;">
                        <div>ชื่อ นามสกุล (ภาษาไทย)</div>
                        <div><asp:TextBox ID="txtContactName1" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactName1" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ชื่อ นามสกุล (ภาษาอังกฤษ)</div>
                        <div><asp:TextBox ID="txtContactName2" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactName2" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>อีเมลฺ์</div>
                        <div><asp:TextBox ID="txtContactEmail" runat="server" Width="300px" MaxLength="500" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactEmail" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>โทรศัพท์</div>
                        <div><asp:TextBox ID="txtContactPhone" runat="server" Width="300px" MaxLength="50" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactPhone" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ที่อยู่ติดต่อ &nbsp;<asp:CheckBox ID="chkAddress" runat="server" Text="เหมือนที่อยู่ของหน่วยงาน" /></div>
                        <div><asp:TextBox ID="txtContactAddress" runat="server" TextMode="MultiLine" Width="420px" Height="50px" MaxLength="1000" CssClass="inputtext"></asp:TextBox>&nbsp;
                            <asp:Label ID="lblContactAddress" runat="server" ForeColor="red">*</asp:Label></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>

                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 4 ข้อมูลของมาตรฐานที่จะลงทะเบียน (OID Information)</div>			
			        <div style="margin-left:10px;">
                        <div>ตัวระบุวัตถุแบบทุติยภูมิ (Secondary identifier)</div>
                        <div><asp:TextBox ID="txtOIDSecondary" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOIDSecondary" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ป้ายชื่อยูนิโค๊ดแบบที่ไม่ใช่จำนวนเต็ม (Non-integer Unicode label)</div>
                        <div><asp:TextBox ID="txtUnicodeLabel" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblUnicodeLabel" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>คำอธิบาย (Description)</div>
                        <div><asp:TextBox ID="txtDesc" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblDescription" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ข้อมูลเพิ่มเติม (Information)</div>
                        <div><asp:TextBox ID="txtInformation" runat="server"  CssClass="inputtext" TextMode="MultiLine" Width="420px" Height="50px" MaxLength="1000"></asp:TextBox></div>

                        <div>กิ่งที่จะลงทะเบียนมาตรฐาน</div>
                        <div>
                            <asp:RadioButton GroupName="parent" ID="nso" Text="nso(2) - National-Standard-Objects"  runat="server" BorderStyle="None" /><br />
                            <asp:RadioButton GroupName="parent" ID="cso" Text="cso(3) - Community-Standard-Objects"  runat="server" BorderStyle="None" />
                        </div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>	
				        <p class="no-border">
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" Width="100px" OnClick="Button1_Click" />     		
				        </p>
                <div style="margin-left:10px;">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>	                					
            </div>				
		<!-- main ends -->	
		</div>
				
    <uc1:Sidebar1 runat="server" ID="Sidebar1" />
</asp:Content>
