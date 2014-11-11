<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="received.aspx.cs" Inherits="OIDReg.received" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<div id="main">
            <div>
			    <h3>ข้อมูลคำร้องบันทึกแล้ว</h3>		
				
			    <div  style="margin:20px 10px;">
                    <div style="font-weight:bold;"></div>
                          กรุณารอการติดต่อกลับจากเจ้าหน้าที่ สพธอ. หากมีข้อสงสัยกรุณาสอบถามข้อมูลเพิ่มเติมได้<br />
                    ที่หมายเลข 0-2123-1234 ต่อ 91011 ทุกวันเวลาราชการ หรืออีเมล oid-ra@npms.or.th
			        </div>
			
				<p class="no-border">
                    <asp:Button ID="Button1" runat="server" Text="ตกลง" CssClass="button" Width="100px" OnClick="Button1_Click"  />     		
				</p>	                					
            </div>				
		<!-- main ends -->	
		</div>
				

    <uc1:Sidebar1 runat="server" ID="Sidebar1" />

</asp:Content>
