<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="sendfile.aspx.cs" Inherits="OIDReg.sendfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    		<div id="main">
            <div>
			    <h2>เอกสารประกอบการพิจารณา</h2>		
				
			    <div  style="margin:5px 10px;">
                    <div style="font-weight:bold;">สำหรับผู้ยื่นคำร้องในกิ่ง nso</div>
                    สำหรับใช้รองรับหมายเลขโอไอดีเพื่อระบุวัตถุตามข้อกำหนดในมาตรฐานที่เกี่ยวกับการทำธุรกรรมทางอิเล็กทรอนิกส์ซึ่งมีการใช้งานในระดับประเทศ ได้แก่ มาตรฐานธุรกรรมทางอิเล็กทรอนิกส์ซึ่งประกาศโดยคณะกรรมการธุรกรรมทางอิเล็กทรอนิกส์ ข้อเสนอแนะมาตรฐานเทคโนโลยีสารสนเทศและการสื่อสารที่จำเป็นต่อธุรกรรมทางอิเล็กทรอนิกส์ซึ่งประกาศโดย สพธอ. หรือมาตรฐานอื่น ๆ 
                    <div>
                        <div>เอกสารที่ต้องส่งประกอบการพิจารณา</div>
                        <div>
                            <ul>
                                <li>สำเนาหนังสือรับรองการจดทะเบียนนิติบุคคล หรือเอกสารแสดงสถานะการเป็นนิติบุคคล หรือหนังสือราชการที่ลงนามโดยผู้มีอำนาจลงนามของหน่วยงาน </li>
                                <li>เอกสารมาตรฐานที่เกี่ยวกับการทำธุรกรรมทางอิเล็กทรอนิกส์ซึ่งมีการใช้งานในระดับประเทศ ได้แก่ มาตรฐานธุรกรรมทางอิเล็กทรอนิกส์ซึ่งประกาศโดยคณะกรรมการธุรกรรมทางอิเล็กทรอนิกส์ ข้อเสนอแนะมาตรฐานเทคโนโลยีสารสนเทศและการสื่อสารที่จำเป็นต่อธุรกรรมทางอิเล็กทรอนิกส์ซึ่งประกาศโดย สพธอ. หรือมาตรฐานอื่น ๆ</li>
                            </ul>
                        </div>
                    </div>
			    </div>

                <div style="margin-top:20px;">
                    <div>
                        <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" />
                    </div>
                </div>		                					
            </div>				
		<!-- main ends -->	
		</div>
				
    <uc1:Sidebar1 runat="server" ID="Sidebar1" />
</asp:Content>
