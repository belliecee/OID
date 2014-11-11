

<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="OIDMaster.update" Codebehind="update.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodytopmainPan">
<div id="bodytopPan">
    <table width="100%">
        <tr>
            <td width="70%">
                หน่วยงาน : &nbsp;<asp:DropDownList ID="ddlRA"  runat="server" Height="22px" 
                    Width="376px" DataSourceID="SqlDataSource1" DataTextField="org_name_th" DataValueField="ra_id" AutoPostBack="True" OnDataBound="ddlRA_DataBound"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT ra_id, org_name_th FROM [registration] "></asp:SqlDataSource>
            </td>
            <td align="right">
                สถานะ &nbsp;:&nbsp;
<asp:DropDownList ID="ddlStatus"  runat="server" Height="22px" 
                    Width="156px" DataSourceID="SqlDataSource3" DataTextField="ustate_desc" DataValueField="ustate_id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT ustate_id, ustate_desc FROM [node_update_status] WHERE ustate_id >0 "></asp:SqlDataSource>
            </td>            
        </tr>
    </table>
     
</div><br />
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
 
<div style="text-align:left;padding:0px 0px; font-family:'Segoe UI'">
        <div style="color:#333;">
            <div style="font-weight:bold;font-size:10pt;margin-bottom:5px;">รายการคำขอลงทะเบียนข้อมูลโอไอดี</div> 
            <div style="margin-bottom:10px;border:0px solid green; font-size:10pt;">

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4" OnItemDataBound="ListView1_ItemDataBound" >
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
                                    <asp:LinkButton ID="lnkDetail" runat="server" OnClick="Detail_Click">ดูรายละเอียด</asp:LinkButton> 
                                </div>
                            </td>

                            <td>
                                <%#Eval("ustate_desc") %>
                                
                            </td>
                            <td>
                                <div>
                                    <asp:LinkButton ID="linkSubmit" runat="server" OnClick="SendRequest_Click">ใช้งานได้</asp:LinkButton>
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
                                        <td class="th" style="width:350px">Total OID</td>
                                        <td class="th" style="width:100px">Status</td>
                                        <td class="th" style="width:100px">Action</td>
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" 
                        SelectCommand="request_list_pending_admin" SelectCommandType="StoredProcedure"   
                    >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlRA" Name="raid" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlStatus" Name="status" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            <div style="font-weight:bold;font-size:10pt;margin-bottom:5px;margin-top:30px;">รายการแก้ไข OID</div> 
            <div style="margin-bottom:10px;border:0px solid green; font-size:10pt;">
                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="ListView2_ItemDataBound" OnDataBound="ListView2_DataBound"  >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#faf7e4">
                            <td><asp:CheckBox ID="chkItem" runat="server" /></td>
                            <td><%#Eval("request_date") %></td>
                            <td style="text-align:left;">
                                <div id="divOwner" runat="server"  style="margin-left:10px; margin-right:10px;">

                                </div>
                            </td>
                            <td style="text-align:left">
                                <div id="divInfo" runat="server" style="margin-left:10px; margin-right:10px;" >

                                </div>
                            </td>
                            <td><%#Eval("ustate_desc") %></td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div style="width:100%; background-color:#f1f2f3;text-align:center; min-height:100px;">  
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />                          
                            <p>ไม่พบรายการแก้ไข</p> 
                            <br />
                            <br />
                            <br />
                            <br />
                            <br /> 
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div style="border:0px solid black">
                            <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                <table ID="itemPlaceholderContainer"  runat="server"  width="100%">
                                    <tr style="background-color:#e1e0f1; height:22px;">
                                        <td style="width:25px;"></td>
                                        <td class="th" style="width:90px">Date/Time</td>
                                        <td class="th" style="width:250px;">Owner</td>
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
                            <table style="width:100%">
                                <tr>
                                    <td width="75%" align="left">
                                            หน้าที่ | 
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
                                        <Fields>
                                            <asp:NumericPagerField ButtonCount="20" 
                                                NumericButtonCssClass="PagerNumericButton" 
                                                NextPreviousButtonCssClass= "NextPrevButton"
                                                CurrentPageLabelCssClass="CurrentPageButton" />
                                        </Fields>
                                    </asp:DataPager>
                                    |
                                    </td>
                                    <td align="right">
                                        <div id ="divUpdate" runat="server" >
                                            <asp:LinkButton ID="lnkDeleteUpdate" runat="server" OnClick="DeleteUpdate_Click" OnClientClick="javascript: return confirm('ต้องการลบรายการใช่ หรือ ไม่?')">ลบรายการ</asp:LinkButton> &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkCommitUpdate" runat="server" OnClick="CommitUpdate_Click">บันทึกรายการ</asp:LinkButton>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>                                              
                    </LayoutTemplate>
                </asp:ListView>    
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" 
                        SelectCommand="request_list_update" SelectCommandType="StoredProcedure" DeleteCommand="SELECT [node].unicode_label, [node_update].*, primary_int, secondary_id, notation1, notation2, [node_update_status].* FROM node_update 
INNER JOIN node ON [node_update].[node_id] = [node].[node_id] 
INNER JOIN [node_update_status] ON [node_update].[status] = [node_update_status].[ustate_id]  
ORDER BY request_id DESC" ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>"   
                    >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlRA" DefaultValue="0" Name="raid" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlStatus" DefaultValue="0" Name="status" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div style="margin:15px 0px;">
                <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
            </div>
        </div>
                <br /><br /><br />
    </div>   

  </div>
</div>
</asp:Content>

