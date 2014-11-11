<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Manage.Master" AutoEventWireup="true" CodeBehind="request.aspx.cs" Inherits="OIDReg.Manage.request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #maindiv {
            margin:10px 30px;
            border:0px solid black
        }

        #maindiv table {
            margin:0px;
        }

        #maindiv td {
            padding-top:4px;
            padding-bottom:4px;
            padding-left:4px;
            padding-right:4px;
            text-align:center;
            line-height:1.2em;
        }
        #maindiv .th {
            font-weight:bold;text-align:center;
            vertical-align:middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="maindiv" >        
        <div style="margin:0px 15px;">
            <div style="font-weight:bold;font-size:12pt;margin-bottom:5px;">รายการเพิ่ม OID</div> 
            <div style="margin-bottom:10px;border:0px solid green; color:#000">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound" >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server">
                            <td><%#Eval("request_id") %></td>
                            <td><%#Eval("request_date")%></td>
                            <td style="text-align:left;">
                                <div><%#Eval("org_name_th")%></div>
                                <div><%#Eval("org_ministry")%></div>
                                <div><%#Eval("app_email") %></div>
                                <div><%#Eval("app_phone") %></div>
                            </td>
                            <td style="text-align:left">
                                <div style="text-align:center;"><%#Eval("request_count")%></div>
                                <div style="margin:5px; border:1px dashed #eee">
                                    <%#Eval("notation2")%>.<%#Eval("primary_int")%>.<span style="color:blue"><%#Eval("request_oid_int")%></span><br /><%#Eval("notation1")%><%#Eval("secondary_id")%>(<%#Eval("primary_int")%>) <span style="color:blue"><%#Eval("request_secondary_id")%> (<%#Eval("request_oid_int")%>)</span>
                                </div>
                                <div style="margin-top:20px; text-align:right">
                                    <asp:LinkButton ID="lnkDetail" runat="server" OnClick="Detail_Click">ดูรายละเอียด</asp:LinkButton> |
                                    <asp:LinkButton ID="lnkDelete" runat="server" OnClick="Delete_Click">ลบรายการ</asp:LinkButton> |
                                </div>
                            </td>
                            <td>
                                <%#Eval("ustate_desc") %>
                                <div>
                                    <asp:LinkButton ID="linkSubmit" runat="server" OnClick="SendRequest_Click">แจ้งแก้ไข</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                            <br />
                            <p>ไม่พบรายการเพิ่มเติม</p> <br />
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div style="border:0px solid black; color:#333">
                            <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                <table ID="itemPlaceholderContainer"  runat="server"  width="100%">
                                    <tr style="background-color:#e1e0f1; height:22px;">
                                        <td class="th" style="width:40px">ID</td>
                                        <td class="th" style="width:80px">Date/Time</td>                                        
                                        <td class="th" >Request By</td>                                        
                                        <td class="th" style="width:300px">Total OID</td>
                                        <td class="th" style="width:100px">Status</td>
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
                        SelectCommand="request_list_pending" SelectCommandType="StoredProcedure"   
                    >
                    <SelectParameters>
                        <asp:SessionParameter Name="raid" SessionField="raid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div style="margin:0px 15px;">
            <div style="font-weight:bold;font-size:12pt;margin-bottom:5px;">รายการแก้ไข OID</div> 
            <div style="margin-bottom:10px;border:0px solid green">
                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="ListView2_ItemDataBound" >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server">
                            <td><%#Eval("request_date") %></td>
                            <td style="text-align:left">
                                <div id="divInfo" runat="server" style="margin-left:10px; margin-right:10px;" >

                                </div>
                            </td>
                            <td><%#Eval("ustate_desc")%></td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                            <br />
                            <p>ไม่พบรายการแก้ไข</p> <br />
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div style="border:0px solid black">
                            <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                <table ID="itemPlaceholderContainer"  runat="server"  width="100%">
                                    <tr style="background-color:#e1e0f1; height:22px;">
                                        <td class="th" style="width:80px">Date/Time</td>
                                        <td class="th">OID</td>
                                        <td class="th" style="width:100px">Status</td>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" 
                        SelectCommand="SELECT [node_update].*, primary_int, secondary_id, notation1, notation2, [node_update_status].* FROM node_update 
                    INNER JOIN node ON [node_update].[node_id] = [node].[node_id] 
                    INNER JOIN [node_update_status] ON [node_update].[status] = [node_update_status].[ustate_id]  
                    WHERE request_by=@raid ORDER BY request_id DESC"   
                    >
                    <SelectParameters>
                        <asp:SessionParameter Name="raid" SessionField="raid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
