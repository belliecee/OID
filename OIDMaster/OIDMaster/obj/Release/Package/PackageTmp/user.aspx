<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="user" Codebehind="user.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodytopmainPan">
    <div id="bodytopPan">
        <div style="margin-left:15px; margin-bottom:10px;">
            <h2>ข้อมูลผู้ใช้งาน</h2>
        </div>        
    </div>
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
        <div id="divMain" style="margin:0px 15px;">
            <div>
                <table width="640" cellpadding="4" cellspacing="1">
                    <tr>
                        <td width="200">Login Name</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="240px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="240px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Width="240px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Group</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="group_name" DataValueField="group_id" Height="24px" Width="171px"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT [group_id], [group_name] FROM [user_group]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>Comment</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Height="75px" TextMode="MultiLine" Width="346px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </div>
            <div style="margin-left:215px">
                <asp:Button ID="btnForward" runat="server"  Text="ตกลง" Width="120px"    />&nbsp;
                <asp:Button ID="Button1" runat="server"  Text="ยกเลิก" Width="120px"    />&nbsp;
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>
</div>
</asp:Content>

