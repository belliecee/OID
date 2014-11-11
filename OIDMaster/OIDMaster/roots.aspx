
<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="roots" Codebehind="roots.aspx.cs" %>

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
            <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="เพิ่มข้อมูลกิ่งหลัก" Width="100px" />
        </div>        
    </div>
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
        <div id="divMain" style="margin:0px 15px;">
            <div style="font-weight:bold;margin-bottom:5px;">รายการกิ่งหลัก</div> 
            <div style="margin-bottom:10px;border:0px solid green">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td style="text-align:center"><%#Eval("node_id") %></td>
                            <td style="text-align:center"><%#Eval("Unicode_Int")%> </td>                            
                            <td style="text-align:center"><%#Eval("unicode_label") %></td>
                            <td style="text-align:center"><%#Eval("secondary_id") %></td>
                            <td style="text-align:center"><%#Eval("subordniate_authority") %></td>
                            <td style="text-align:center"><%#Eval("description") %></td> 
                            <td style="text-align:center"><%#Eval("information") %></td>
                            <td style="text-align:center"><%#Eval("notation1") %></td>
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
                                        <td class="th" style="width:100px">Node Id</td>     
                                       <td class="th" style="width:280px">Unicode Int</td>                                    
                                        <td class="th" style="width:280px">Unicode Label</td>
                                        <td class="th" style="width:100px">Secondary Id</td>
                                        <td class="th" style="width:100px">Subordniate Authority</td>
                                        <td class="th" style="width:100px">Description</td>
                                        <td class="th" style="width:100px">Information</td>
                                        <td class="th" style="width:100px">Notation</td>
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
                        SelectCommand="SELECT [node_id] ,[Unicode_Int],[unicode_label]
      ,[secondary_id], [subordniate_authority] ,[description], [information], [notation1]
      ,[notation2], [notation3] FROM [CMREPO].[dbo].[root]"   
                    >
                   
                </asp:SqlDataSource>                
            </div>
        </div>
    </div>
</div>
</asp:Content>

