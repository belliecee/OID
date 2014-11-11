<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="FirstLogin.aspx.cs" Inherits="OIDReg.FirstLogin" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    		<div id="main">
                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">Login</div>		
                    <div style="margin:10px 10px;">
                        ยินดีต้อนรับเข้าสู่ระบบลงทะเบียนโอไอดี ท่านกำลัง Login ด้วยชื่อบัญชีชั่วคราว ท่านสามารถเปลี่ยนชื่อบัญชีของท่านและรหัสผ่าน
                        ได้ในการ Login ครั้งนี้เท่าน้น หากท่านไม่ต้องการ ก็ให้ข้ามขั้นตอนนี้ไป
                    </div>	
			        <div style="margin-left:10px;">
                        <div>New User name</div>
                        <div><asp:TextBox ID="t1" runat="server" Width="300px" MaxLength="50" CssClass="inputtext"></asp:TextBox></div>
                        <div>password</div>
                        <div><asp:TextBox ID="t2" runat="server" Width="300px" MaxLength="100" CssClass="inputtext" TextMode="Password"></asp:TextBox></div>
                        <div>Confirm password</div>
                        <div><asp:TextBox ID="t3" runat="server" Width="300px" MaxLength="100" CssClass="inputtext" TextMode="Password"></asp:TextBox></div>
  

			        </div>
                      <div style="margin:20px 0px;">
                            <table width="100%" style="margin:0px 0px; border: 0px solid white" cellpadding="0" cellspacing="0" border="1">
                                <tr>
                                    <td width="50%" style="border:0px solid white; margin:0px 0px">
                                        <asp:Button ID="Button1" runat="server" Text="เปลี่ยนชื่อผู้ใช้และรหัสผ่าน" Width="160px" CssClass="button" OnClick="Button1_Click"  /> 
                                    </td>
                                    <td width="50%" style="border:0px solid white; text-align:right">
                                        <asp:Button ID="Button2" runat="server" Text="ฉันพอใจกับชื่อนี้" Width="140px" CssClass="button" OnClick="Button2_Click"   /> 
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="margin:20px 10px;">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                </div>	
		<!-- main ends -->	
		</div>
    <uc1:Sidebar1 runat="server" ID="Sidebar1" />
</asp:Content>
