<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="findoid.aspx.cs" Inherits="OIDReg.findoid" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <div>			
                <div style="margin-top:10px;">		
			        <div style="margin-left:10px;font-weight:bold;">
                       ไม่พบข้อมูลของหมายเลข OID ที่ระบุ
			        </div>
                </div>		
                
                <div style="margin-top:20px;">
			        <div style="margin-left:10px;">
                        กรุณาตรวจสอบการป้อนข้อมูล OID ของท่านและทดลองค้นหาใหม่อีกครั้ง
			        </div> 			        
                </div>	

                <div style="margin-top:20px;">

                </div>	

                <p class="no-border">
                    หมายเลขโอไอดีที่ถูกลงทะเบียนเพื่อใช้ระบุวัตถุ จะไม่ถูกนำมาใช้ซ้ำ สำนักมาตรฐาน สำนักงานพัฒนาอุตสาหกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน) จะเป็นผู้ดูแลและปรับปรุงข้อมูลทะเบียนหมายเลขโอไอดีภายใต้กิ่ง etda(1) เป็นระยะๆ โดยสามารถดูรายละเอียดเพิ่มเติมได้จาก URL: http://standard.etda.or.th
                </p>
				        <p class="no-border" >
                            <asp:Button ID="Button1" runat="server" Text="ตกลง" CssClass="button" Width="100px" Height="26px" />                               		
				        </p>
                <div style="margin-left:10px;">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>	                					
            </div>		
    </div>
    <uc1:Sidebar1 runat="server" ID="Sidebar1" />
</asp:Content>
