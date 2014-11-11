﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="OIDReg.register" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <style type="text/css">
        .radio_control {
           border-width: 0px;
	       border-style: solid;
  	       border-color: #d4d4d4 #ebebeb #ebebeb #d4d4d4; 
        }
        .auto-style1 {
            font-weight: normal;
        }
        .auto-style2 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


		<div id="main">
            <div>
			    <h2>แบบคำขอลงทะเบียน</h2>		
				
			    <div  style="margin:5px 10px;">
                    <div style="font-weight:bold;">สำหรับผู้ยื่นคำร้องที่มีคุณสมบัติดังนี้</div>
                    เป็นหน่วยงานหรือเครือข่ายหน่วยงาน หรือองค์กรวิขาชีพ ที่เป็นนิติบุคคลตามกฎหมาย มีคณะบุคลากรที่มีความสามารถ ความเชี่ยวชาญ และประสบการณ์ในงานมาตรฐานด้านธุรกรรมทางอิเล็กทรอนิกส์เฉพาะสาขารวมถึงทรัพยากรและโครงสร้างองค์กรที่มีความชัดเจนรองรับ<br />
			    </div>
			
                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 1 ข้อมูลของผู้ยื่นคำร้อง หรือ ผู้ดำเนินการของหน่วยงาน
                        <br />
                        (Applicant or Organization Operator Information)<br />
                        <br />
                        <span class="auto-style1"><span class="auto-style2"><strong>ผู้ยื่นคำร้อง</strong></span> มีหน้าที่ในการส่งแบบคำขอลงทะเบียนและเอกสารที่เกี่ยวข้องทางเว็บไซต์ลงทะเบียนหมายเลขโอไอดี รวมถึงการส่งข้อมูลเพิ่มเติมตามที่เจ้าหน้าที่รับลงทะเบียนร้องขอ<br /> <strong><span class="auto-style2">ผู้ดำเนินการของหน่วยงาน</span> </strong>มีหน้าที่ในการบริหารจัดการข้อมูลหมายเลขโอไอดีภายใต้กิ่งของหน่วยงานผ่านทางเว็บไซต์ลงทะเบียนหมายเลขโอไอดี เพื่อนำเสนอต่อผู้มีสิทธิ์อนุมัติของหน่วยงาน</span></div>			
			        <div style="margin-left:10px;">
                        <div>ชื่อ-นามสกุล (ภาษาไทย)</div>
                        <div><asp:TextBox ID="txtName1" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblNameTh" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ชื่อ-นามสกุล (ภาษาอังกฤษ)</div>
                        <div><asp:TextBox ID="txtNameEn" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblNameEn" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>อีเมล</div>
                        <div><asp:TextBox ID="txtEmail" runat="server" Width="300px" MaxLength="500" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblEmail" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>โทรศัพท์</div>
                        <div><asp:TextBox ID="txtContactPhone" runat="server" Width="300px" MaxLength="50" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactPhone" runat="server" ForeColor="red">*</asp:Label></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>		
          
               <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 2 ข้อมูลของผู้มีสิทธิ์อนุมัติของหน่วยงาน (Organization Approver Information)<br />
                        <br />
                        <span class="auto-style1"><span class="auto-style2">ผู้มีสิทธิ์อนุมัติของหน่วยงาน</span> มีหน้าที่พิจารณาความเหมาะสมของการบริหารจัดการข้อมูลหมายเลขโอไอดีภายใต้กิ่งของหน่วยงาน เพื่ออนุมัติให้เจ้าหน้าที่รับลงทะเบียนดำเนินการบันทึกข้อมูลหมายเลขโอไอดีในระบบ</span></div>			
			        <div style="margin-left:10px;">
                        <div>ชื่อ นามสกุล (ภาษาไทย)</div>
                        <div><asp:TextBox ID="txtContactName1" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactName1" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ชื่อ นามสกุล (ภาษาอังกฤษ)</div>
                        <div><asp:TextBox ID="txtContactName2" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactName2" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>อีเมล</div>
                        <div><asp:TextBox ID="txtContactEmail" runat="server" Width="300px" MaxLength="500" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblContactEmail" runat="server" ForeColor="red">*</asp:Label></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>      

                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 3 ข้อมูลขององค์กร (Organization Information)</div>			
			        <div style="margin-left:10px;">
                        <div>ชื่อหน่วยงาน (ภาษาไทย)</div>
                        <div><asp:TextBox ID="txtOrgNameTh" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgName1" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ชื่อหน่วยงาน (ภาษาอังกฤษ)</div>
                        <div><asp:TextBox ID="txtOrgNameEn" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgName2" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>สังกัด</div>
                        <div><asp:TextBox ID="txtMinistry" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox></div>
                        <div>อีเมล</div>
                        <div><asp:TextBox ID="txtOrgEmail" runat="server" Width="300px" MaxLength="500" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgEmail" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>เว็บไซต์</div>
                        <div><asp:TextBox ID="txtWebSite" runat="server" Width="300px" MaxLength="240" CssClass="inputtext"></asp:TextBox>&nbsp;</div>
                        <div>โทรศัพท์</div>
                        <div><asp:TextBox ID="txtOrgPhone" runat="server" Width="300px" MaxLength="50" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgPhone" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>โทรสาร</div>
                        <div><asp:TextBox ID="txtOrgFax" runat="server" Width="300px" MaxLength="50" CssClass="inputtext"></asp:TextBox></div>
                        <div>ที่ตั้งหน่วยงาน</div>
                        <div><asp:TextBox ID="txtOrgAddress" runat="server" TextMode="MultiLine" Width="420px" Height="50px" MaxLength="1000" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOrgAddress" runat="server" ForeColor="red">*</asp:Label></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>	



                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 4 ข้อมูลของมาตรฐานที่จะลงทะเบียน (OID Information)</div>			
			        <div style="margin-left:10px;">
                        <div>ตัวระบุวัตถุแบบทุติยภูมิ (Secondary identifier)</div>
                        <div><asp:TextBox ID="txtOIDSecondary" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblOIDSecondary" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ป้ายชื่อยูนิโคดแบบที่ไม่ใช่จำนวนเต็ม (Non-integer Unicode label)</div>
                        <div><asp:TextBox ID="txtUnicodeLabel" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblUnicodeLabel" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>คำอธิบาย (Description)</div>
                        <div><asp:TextBox ID="txtDesc" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox>&nbsp;<asp:Label ID="lblDescription" runat="server" ForeColor="red">*</asp:Label></div>
                        <div>ข้อมูลเพิ่มเติม (Information)</div>
                        <div><asp:TextBox ID="txtInformation" runat="server"  CssClass="inputtext" TextMode="MultiLine" Width="420px" Height="50px" MaxLength="1000"></asp:TextBox></div>

                        <div>กิ่งที่ลงทะเบียน<br />
                            <asp:DropDownList ID="ddlroot" runat="server" Width="430px" DataSourceID="SqlDataSource1" CssClass="inputdropdown" DataTextField="roortname" DataValueField="primary_int">
                            </asp:DropDownList><br />
                            <asp:Label ID="lblRoot" runat="server" ForeColor="Red">*</asp:Label>
                        </div>
                        <div>
                            
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="select -1 as  primary_int,'กรุณาเลือกกิ่งที่ลงทะเบียน' as roortname
union
SELECT primary_int, [secondary_id] + ' ' + '(' + unicode_int  + ')' + ' - ' + unicode_label as rootname FROM [CMREPO].[dbo].[root] where node_id &gt; 1 order by primary_int" ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>">
                            </asp:SqlDataSource>
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


        </ContentTemplate>
    </asp:UpdatePanel>

				
    <uc1:Sidebar1 runat="server" ID="Sidebar1" />
</asp:Content>
