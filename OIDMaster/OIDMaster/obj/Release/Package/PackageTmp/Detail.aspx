<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="OIDMaster.Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodytopmainPan">
    <div id="bodytopPan">
                <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;font-size:11pt;">รายการเพิ่ม/แก้ไข กิ่งใหม่</div>				
                <div style="width:auto">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound">
                        <ItemTemplate>
                            <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                                <td id="td_no" runat="server"></td>
                                <td>
                                    Parent : <span style="color:blue"><%#Eval("notation2")%></span>
                                    <table cellpadding="0" cellspacing="0" border="0" style="margin:0px;">
                                        <tr style="height:16px;">
                                            <td>primray_int</td>
                                            <td>integer unicode label</td>
                                            <td>secondary_id</td>
                                            <td>non integer unicode label</td>
                                        </tr>
                                        <tr style="height:16px;">
                                            <td style="text-align:center"><%#Eval("request_oid_int")%></td>
                                            <td style="text-align:center"><%#Eval("request_unicode_int")%></td>
                                            <td><%#Eval("request_secondary_id") %></td>
                                            <td><%#Eval("request_unicode_label") %></td>
                                        </tr>
                                    </table>
                                    <div style="width:100%">
                                        <div style="padding:5px; margin:5px 0px; background-color:#f1f2f3">
                                            <b>Description</b>
                                            <div style="margin-left:20px;margin-bottom:15px;">
                                                <%#Eval("request_description")%>
                                            </div>
                                            <b>Information</b>
                                            <div style="margin-left:20px;">
                                                <%#Eval("request_information")%>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                                <br />
                                <p>ไม่พบรายการ oid ในคำขอนี้</p>
                                <br />
                            </div>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div style="border:0px solid black">
                                <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                    <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellspacing="1"  runat="server"  width="100%">
                                        <tr style="background-color:#e1e0f1; height:22px;">
                                            <td class="th" width="50">ลำดับที่</td>
                                            <td class="th" >node_info</td>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                    <br />                                
                                </div>
                            </div>                                              
                        </LayoutTemplate>
                    </asp:ListView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT *, (SELECT top 1 notation2 from [node] where [node].[node_parent_Id] = [node_request_entry].[request_parent_id]) as 'notation2' 
FROM [node_request_entry] 
WHERE request_id=@reqid  
ORDER BY request_entry_id
">
                        <SelectParameters>
                            <asp:SessionParameter Name="reqid" SessionField="requestentry" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>				
		<!-- main ends -->	
		</div>
</asp:Content>
