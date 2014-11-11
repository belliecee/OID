<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OIDReg.Login" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

		<div id="main">
                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">Login</div>			
			        <div style="margin-left:10px;">
                        <div>User name</div>
                        <div><asp:TextBox ID="t1" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox></div>
                        <div>password</div>
                        <div><asp:TextBox ID="t2" runat="server" Width="300px" MaxLength="250" CssClass="inputtext" TextMode="Password"></asp:TextBox></div>
                        <div style="margin:10px 0px;">
                            <asp:Button ID="Button1" runat="server" Text="SUBMIT" Width="100px" CssClass="button" OnClick="Button1_Click"  /> 
                        </div>
                        <div>
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </div>
			        </div>
                </div>	
		<!-- main ends -->	
		</div>
				

    <uc1:Sidebar1 runat="server" ID="Sidebar1" />

</asp:Content>
