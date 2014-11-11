<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Default.master" CodeFile="userlog.aspx.cs" Inherits="userlog" %>


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
        <table width="100%">
        <tr>
            <td align="right">
                
                การปฏิบัติงาน &nbsp;:&nbsp;

                <asp:DropDownList ID="DropDownList1"  runat="server" Height="22px" 
                    Width="156px" DataSourceID="SqlDataSource3" DataTextField="action_name" DataValueField="action_id" AutoPostBack="True" runat="server"  OnDataBound="DropDownList1_DataBound">
                         <%--<asp:ListItem Text="ทั้งหมด" Selected="true" Value="0"></asp:ListItem>--%>
                </asp:DropDownList>

              
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT * FROM [user_action] "></asp:SqlDataSource>
            
                
            </td>            
        </tr>
    </table>
        <div style="margin-left:15px; margin-bottom:10px;">
            <h2>User Log</h2>
        </div>        
    </div>
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
        <div id="divMain" style="margin:0px 15px;">
            <div style="font-weight:bold;margin-bottom:5px;font-size:12pt;">Log</div> 
            <div style="margin-bottom:10px;border:0px solid green">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff; height:25px;">
                            <td style="text-align:center"><%#Eval("log_date") %></td>
                            <td style="text-align:left;padding:0px 8px;">
                                <%#Eval("user_name") %>
                            </td>
                            <td style="text-align:center;padding:0px 8px;">
                               <%-- <%#Eval("ip_address") %>--%>
                            </td>
                            <td style="text-align:center"><%#Eval("action_name") %></td>
                            
                        </tr>
                    </ItemTemplate>
                     <EmptyDataTemplate>
                        <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                            <br /><br /><br /><br /><br />
                            <p>ไม่พบรายการดังกล่าว</p> <br /><br /><br /><br />
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div style="border:0px solid black">
                            <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellspacing="1"  runat="server"  width="100%">
                                    <tr style="background-color:#e1e0f1; height:24px;">
                                        <td class="th" style="width:180px">วัน เวลา</td>
                                        <td class="th"   style="width:200px">ชื่อผู้ใช้งาน</td>
                                        <td class="th" style="width:150px">IP Address</td>
                                        <td class="th" style="width:180px">ปฏิบัติงาน</td>
                                        
                                        
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="get_actionlog" SelectCommandType="StoredProcedure" 
                    ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" 
                    >
                    <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0"  Name="actionid"  PropertyName="SelectedValue" Type="Int32" />  
                    </SelectParameters>
                </asp:SqlDataSource>                
            </div>
            
                <br />
                <br />
            
        </div>
    </div>
</div>
</asp:Content>