<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="Manage.Master" CodeBehind="summary.aspx.cs" Inherits="OIDReg.summary" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
        <div id="main">
             สรุปหมายเลข OID ภายใต้ <b><asp:Label ID="lbOrgName" runat="server" Text="Label"></asp:Label>&nbsp;(<asp:Label ID="secondId" runat="server" Text="Label"></asp:Label>)</b> วันที่ <%=System.DateTime.Now.ToString("dd MMMM yyyy")%> |<asp:LinkButton ID="LinkButton1" CommandArgument="1" OnClick="LinkButton1_Click " runat="server">Save As</asp:LinkButton> 
            <div style="margin-top:5px; margin-bottom:10px;">
                
                <asp:HiddenField ID="HiddenField1" runat="server" />

    
               <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound" OnDataBound="ListView1_DataBound"   >
                   <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td id="td_no" runat="server">1</td>
                            <td align="left">&nbsp;<%#Eval("dot_notation") %></td>
                            <td align="left">&nbsp;<%#Eval("org_name_th") %></td>
                            <td align="center"><%#Eval("secondary_id") %></td>
                            <td align="center"><%#Eval("sub_ordinate") %></td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                            <br /><br /><br /><br /><br />
                            <p>ไม่พบรายการคำขอลงทะเบียน</p> <br /><br /><br /><br />
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div style="border:0px solid black">
                            <div style="background-color:#ffffff;text-align:center;">
                                <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellpadding="3" cellspacing="1"  runat="server"  width="100%">
                                    <tr style="background-color:#e1e0f1; height:22px;">
                                        <td class="th" style="width:60px">ลำดับ</td>
                                        <td class="th" style="width:150px">หมายเลขโอไอดี</td>
                                        <td class="th" >หน่วยงาน</td>
                                        <td class="th" style="width:150px">ชื่อกิ่งหลัก</td>
                                        <td class="th" style="width:100px">จำนวนรายการ</td>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                    <tr style="background-color:#ffffff">
                                        <td colspan="4" style="text-align:right">รวมทั้งสิ้น&nbsp;</td>
                                        <td><asp:Label ID="lblTotal" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <br />                                
                            </div>
                        </div> 
                                           
                    </LayoutTemplate>
                </asp:ListView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="query_node_summary" SelectCommandType="StoredProcedure">
                   <SelectParameters>
                       <%--<asp:Parameter Name="root_id" Type="Int32" DefaultValue="1" />--%>
                       <asp:ControlParameter ControlID="HiddenField1" Name="root_id" PropertyName="Value" />
                   </SelectParameters>
               </asp:SqlDataSource>

        <!-- main ends -->	
		</div>
       </div>
        <uc1:Sidebar1 runat="server" id="Sidebar1" />


</asp:Content>