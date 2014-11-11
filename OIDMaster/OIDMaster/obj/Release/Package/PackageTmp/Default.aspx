<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="_Default" Codebehind="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="bodytopmainPan">
<div id="bodytopPan">
</div>

    <asp:HiddenField ID="HiddenField1" runat="server" />

</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
       <div>

            สรุปหมายเลข OID ภายใต้ <b>สำนักงานพัฒนาธุรกรรมอิเล็กทรอนิกส์</b> วันที่ <%=System.DateTime.Now.ToString("dd MMMM yyyy")%> | <asp:LinkButton ID="LinkButton1"  runat="server" OnClick="LinkButton1_Click " CommandArgument="1">Save As</asp:LinkButton>
           <div style="margin-top:5px; margin-bottom:10px;">
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
                       <asp:Parameter Name="root_id" Type="Int32" DefaultValue="1" />
                   </SelectParameters>
               </asp:SqlDataSource>

           </div>
<!-- Loop of LISTVIEW -->
            <% 
               
                int fieldNum = Convert.ToInt32(HiddenField1.Value);
               //string datasourceStr;
               //for (int i = 0; i < fieldNum; i++) { 
               
               
           %>
           <%  // datasourceStr = "SqlDataSource" + i;
                      
           %>
              
           สรุปหมายเลข OID ภายใต้ <b>สำนักโครงสร้างพื้นฐาน</b> วันที่ <%=System.DateTime.Now.ToString("dd MMMM yyyy")%> | <asp:LinkButton  ID="LinkButton2" runat="server" CommandArgument="2" OnClick="LinkButton2_Click">Save As</asp:LinkButton>
           <div style="margin-top:5px; margin-bottom:10px;">
               <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource"  OnItemDataBound="ListView1_ItemDataBound" OnDataBound="ListView1_DataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td id="td_no" runat="server">2</td>
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
               <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="query_node_summary" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>">
                   <SelectParameters>
                       <asp:Parameter Name="root_id" Type="Int32" DefaultValue='2' runat="server" />
                   </SelectParameters>
               </asp:SqlDataSource>
            <br/><br/>
<!-- End of List -->


             สรุปหมายเลข OID ภายใต้ <b>สำนักโครงสร้างพื้นฐาน</b> วันที่ <%=System.DateTime.Now.ToString("dd MMMM yyyy")%> | <asp:LinkButton  ID="LinkButton3" CommandArgument="3" runat="server" OnClick="LinkButton3_Click">Save As</asp:LinkButton>
           <div style="margin-top:5px; margin-bottom:10px;">
               <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3"  OnItemDataBound="ListView1_ItemDataBound" OnDataBound="ListView1_DataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td id="td_no" runat="server">2</td>
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
               <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="query_node_summary" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>">
                   <SelectParameters>
                       <asp:Parameter Name="root_id" Type="Int32" DefaultValue='3' runat="server" />
                   </SelectParameters>
               </asp:SqlDataSource>
            <br/><br/>

<!-- End of List -->
           สรุปหมายเลข OID ภายใต้ <b>สำนักมาตรฐาน (CSO)</b> วันที่ <%=System.DateTime.Now.ToString("dd MMMM yyyy")%> | <asp:LinkButton  ID="LinkButton4"  CommandArgument="4" runat="server" OnClick="LinkButton4_Click">Save As</asp:LinkButton>
           <div style="margin-top:5px; margin-bottom:10px;">
               <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4"  OnItemDataBound="ListView1_ItemDataBound" OnDataBound="ListView1_DataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td id="td_no" runat="server">2</td>
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
               <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="query_node_summary" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>">
                   <SelectParameters>
                       <asp:Parameter Name="root_id" Type="Int32" DefaultValue='4' runat="server" />
                   </SelectParameters>
               </asp:SqlDataSource>
<!-- End of List -->
               <br/><br/>
           สรุปหมายเลข OID ภายใต้ <b>สำนักมาตรฐาน (CSO)</b> วันที่ <%=System.DateTime.Now.ToString("dd MMMM yyyy")%> | <asp:LinkButton  ID="LinkButton5"  CommandArgument="5" runat="server" OnClick="LinkButton5_Click">Save As</asp:LinkButton>
           <div style="margin-top:5px; margin-bottom:10px;">
               <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5"  OnItemDataBound="ListView1_ItemDataBound" OnDataBound="ListView1_DataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td id="td_no" runat="server">2</td>
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
               <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="query_node_summary" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>">
                   <SelectParameters>
                       <asp:Parameter Name="root_id" Type="Int32" DefaultValue='5' runat="server" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <br/><br/>
                  สรุปหมายเลข OID ภายใต้ <b>สำนักวิจัยและพัฒนา</b> วันที่ <%=System.DateTime.Now.ToString("dd MMMM yyyy")%> | <asp:LinkButton  ID="LinkButton6" CommandArgument="6" runat="server" OnClick="LinkButton6_Click">Save As</asp:LinkButton>
           <div style="margin-top:5px; margin-bottom:10px;">
               <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource6"  OnItemDataBound="ListView1_ItemDataBound" OnDataBound="ListView1_DataBound"   >
                    <ItemTemplate>
                        <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                            <td id="td_no" runat="server">2</td>
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
               <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="query_node_summary" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>">
                   <SelectParameters>
                       <asp:Parameter Name="root_id" Type="Int32" DefaultValue='6' runat="server" />
                   </SelectParameters>
               </asp:SqlDataSource>
          
<!-- End of Loop -->


           </div>


      <br />

     
  </div>
</div>
   
    </div>
    </div>
    </div>
    </div>
    </div>
</asp:Content>

