<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="requests" Codebehind="requests.aspx.cs" %>

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
            text-align: left;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodytopmainPan">
    <div id="bodytopPan">
        <div style="margin-left:15px; margin-bottom:10px;">
            เลือกสถานะ&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Width="150px" style="padding:2px;" DataSourceID="SqlDataSource2" DataTextField="status_caption" DataValueField="status_id" AutoPostBack="True" OnDataBound="DropDownList1_DataBound">
                <asp:ListItem Text="ทั้งหมด" Value="0"></asp:ListItem>
                            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT status_id, status_caption FROM [registration_status] WHERE status_apply=1"></asp:SqlDataSource>
        </div>        
    </div>
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
        <div id="divMain" style="margin:0px 15px;">
            <div style="font-weight:bold;margin-bottom:5px;">รายการคำขอลงทะเบียนข้อมูลโอไอดี</div> 
            <div style="margin-bottom:10px;border:0px solid green">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td><%#Eval("reg_created_date") %></td>
                            <td style="text-align:left;padding:0px 5px;">
                                <%#Eval("app_name_th")%> (<%#Eval("app_name_en")%>)<br />
                                <%#Eval("org_name_th")%><br />
                                <%#Eval("app_email") %><br />
                                โทร: <%#Eval("app_phone")%>
                            </td>
                            <td style="text-align:left;padding:0px 5px;">
                                กิ่งที่ต้องการ: <span style="color:#ff6600"><%#Eval("secondary_id")%>(<%#Eval("primary_int")%>)</span>
                                <div style="margin-top:5px;border-top:1px dashed #999; margin-left:10px;margin-right:5px;">
                                    Primary Integer : <span style="font-weight:bold; color:blue"><%#Eval("reg_assign_oid_no") %></span><br />
                                    Unicode Label : <%#Eval("oid_request_nonint_label") %><br />
                                    Secondary ID : <%#Eval("oid_request_secondary") %><br />
                                </div>
                            </td>
                            <td style="text-align:center"><%#Eval("status_caption") %></td>
                            <td>
                                <asp:LinkButton ID="lnkDetail" runat="server" OnClick="LinkButton1_Click">ดำเนินการ</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                            <br /><br /><br /><br /><br />
                            <p>ไม่พบรายการคำขอลงทะเบียน</p> <br /><br /><br /><br /><br /><br /><br />
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div style="border:0px solid black">
                            <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellspacing="1"  runat="server"  width="100%">
                                    <tr style="background-color:#e1e0f1; height:22px;">
                                        <td class="th" style="width:100px">วันที่</td>
                                        <td class="th" >ผู้ขอ</td>
                                        <td class="th" style="width:280px">ข้อมูลวัตถุ</td>
                                        <td class="th" style="width:100px">สถานะ</td>
                                        <td class="th" style="width:100px"></td>
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
                        SelectCommand="request_list_register" SelectCommandType="StoredProcedure"   
                    >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="status" PropertyName="SelectedValue" />
                    </SelectParameters>
                   
                </asp:SqlDataSource>                
            </div>
        </div>
    </div>
</div>
</asp:Content>

