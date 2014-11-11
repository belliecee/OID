

<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="rejectReasonList" Codebehind="rejectReasonList.aspx.cs" %>

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
  <div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
        <div id="divMain" style="margin:0px 15px;">
            <div style="font-weight:bold;margin-bottom:5px;">รายการเหตุผลที่ไม่ผ่านการอนุมัติ</div> 
            <div style="margin-bottom:10px;border:0px solid green">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td><%#Eval("reason_id") %></td>
                            
                            <td style="text-align:center"><%#Eval("reason_desc") %></td>
                            <td>
                                <asp:LinkButton ID="lnkEdit" runat="server" OnClick="LinkButton1_Click">แก้ไข</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkCancel" runat="server" OnClick="LinkButton1_Click">ลบ</asp:LinkButton>
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
                                        <td class="th" style="width:100px">ลำดับที่</td>
                                        <td class="th" >รายการเหตุผล</td>                                       
                                        <td class="th" style="width:100px"></td>
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
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="status" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>                
            </div>
        </div>
    </div>
</div>
</asp:Content>
