<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Manage.Master" AutoEventWireup="true" CodeBehind="oidchanged.aspx.cs" Inherits="OIDReg.Manage.oidchanged" %>

<%@ Register Src="~/Manage/Sidebar2.ascx" TagPrefix="uc1" TagName="Sidebar2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:HiddenField ID="NodeID" runat="server" />
		<div id="main">
            <div>
                <div style="margin:0px 10px;display:none">
                    <b>Full Path</b> 
                    <div id="divParent" runat="server" style="margin-bottom:0px;font-size:11pt;"></div>
                </div>				
                <div style="margin-top:10px;">		
			        <div style="margin-left:10px;font-weight:bold;">
                        บันทึกการแก้ไขข้อมูลของโอไอดีสำเร็จ
			        </div>
                </div>		
                
                <div style="margin-top:20px;">
			        <div style="margin-left:10px;">
                        ข้อมูลของการแก้ไขทั้งหมดจะมีการบันทึกลงฐานข้อมูลโอไอดีของสำนักพัฒนามาตรฐานภายใน&nbsp; 3 วันทำการ </div> 			        
                </div>	

                <div style="margin-top:20px;">

                </div>	

                <p class="no-border">
                    หมายเลขโอไอดีที่ถูกลงทะเบียนเพื่อใช้ระบุวัตถุ จะไม่ถูกนำมาใช้ซ้ำ สำนักมาตรฐาน สำนักงานพัฒนาอุตสาหกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน) จะเป็นผู้ดูแลและปรับปรุงข้อมูลทะเบียนหมายเลขโอไอดีภายใต้กิ่ง etda(1) เป็นระยะๆ&nbsp;
                หากมีข้อสงสัยกรุณาติดต่อเจ้าหน้าที่ดูแลระบบ 
                    <br />
                    ได้ที่อีเมล: <a href="mailto:oid-ra@npms.or.th">oid-ra@npms.or.th</a>
                    <br />
                    โทรศัพท์: 0-2123-1234 ต่อ 91011
</p>
				        <p class="no-border" >
                            <asp:Button ID="Button1" runat="server" Text="ตกลง" CssClass="button" Width="100px" Height="26px" OnClick="Button1_Click" />                               		
				        </p>
                <div style="margin-left:10px;">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>	                					
            </div>				
		<!-- main ends -->	
		</div>
    <uc1:Sidebar2 runat="server" id="Sidebar2" />
</asp:Content>
