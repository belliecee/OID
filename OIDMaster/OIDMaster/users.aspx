<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="users" Codebehind="users.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #divMain {
            padding:0px;
            margin:0px;
            font-size:10pt;
        }

        #divMain table {

        }

        .th {
            font-weight: bold;
            font-size:10pt;
            text-align: center;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodytopmainPan">
    <div id="bodytopPan">
        <div style="margin-left:15px; margin-bottom:10px;">
            <h2>รายชื่อผู้ใช้งานในระบบ</h2>
        </div>        
    </div>
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
        <div id="divMain" style="margin:0px 15px;">
            <div style="font-weight:bold;margin-bottom:5px;font-size:12pt;">ผู้ใช้งานทั้งหมด</div> 
            <div style="margin-bottom:10px;border:0px solid green">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff; height:25px;">
                            <td style="text-align:center"><%#Eval("user_add_date") %></td>
                            <td style="text-align:left;padding:0px 8px;">
                                <%#Eval("user_name") %>
                            </td>
                            <td style="text-align:center;padding:0px 8px;">
                                <%#Eval("group_name") %>
                            </td>
                            <td style="text-align:center"><%#(Convert.ToInt32(Eval("user_status")) == 0)? ("ไม่ใช้งาน"):("ใช้งานได้") %></td>
                            <td>
                                <asp:LinkButton ID="lnkDetail" runat="server" >แก้ไข</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div style="border:0px solid black">
                            <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellspacing="1"  runat="server"  width="100%">
                                    <tr style="background-color:#e1e0f1; height:24px;">
                                        <td class="th" style="width:180px">เริ่มวันที่</td>
                                        <td class="th" >ชื่อผู้ใช้งาน</td>
                                        <td class="th" style="width:240px">กลุ่ม</td>
                                        <td class="th" style="width:180px">สถานะ</td>
                                        <td></td>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                                <br />                                
                            </div>
                        </div> 
                        <div style="text-align:center;margin:5px 0px;">
                                    Pages | 
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
                                <Fields>
                                    <asp:NumericPagerField ButtonCount="20" 
                                        NumericButtonCssClass="PagerNumericButton" 
                                        NextPreviousButtonCssClass= "NextPrevButton"
                                        CurrentPageLabelCssClass="CurrentPageButton" />
                                </Fields>
                            </asp:DataPager>
                        </div>                                              
                    </LayoutTemplate>
                </asp:ListView>    
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" 
                        SelectCommand="SELECT * FROM [user] INNER JOIN [user_group] ON user_group = group_id"   
                    >
                </asp:SqlDataSource>                
            </div>
            <div>
                <asp:Button ID="btnForward" runat="server"  Text="เพิ่มผู้ใช้งาน" Width="120px"    />&nbsp;
                <br />
                <br />
            </div>
        </div>
    </div>
</div>
</asp:Content>

