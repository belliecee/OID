<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Manage.Master" AutoEventWireup="true" CodeBehind="loadoid.aspx.cs" Inherits="OIDReg.Manage.loadoid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:HiddenField ID="NodeID" runat="server" />
		<div id="main">
            <div>
                <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;font-size:11pt;">นำเข้าข้อมูลกิ่งใหม่</div>	
                <div style="margin:5px 10px;">
                    <b>ไฟล์ข้อมูล<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </b> 
                    &nbsp;<div style="font-size:11pt;">
                        <asp:HiddenField ID="RootID" runat="server" />
                        <asp:HiddenField ID="RootNode" runat="server" />


                        <asp:FileUpload ID="FileUploadControl" runat="server" Width="393px" />

                    </div>
                </div>					
                

                <p class="no-border">
                    หมายเลขโอไอดีที่ถูกลงทะเบียนเพื่อใช้ระบุวัตถุ จะไม่ถูกนำมาใช้ซ้ำ สำนักมาตรฐาน สำนักงานพัฒนาอุตสาหกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน) จะเป็นผู้ดูแลและปรับปรุงข้อมูลทะเบียนหมายเลขโอไอดีภายใต้กิ่ง etda(1) เป็นระยะๆ โดยสามารถดูรายละเอียดเพิ่มเติมได้จาก URL: http://standard.etda.or.th
                </p>
				        <p class="no-border" >
                            <asp:Button ID="Button1" runat="server" Text="ตกลง" CssClass="button" Width="100px" Height="26px" OnClick="Button1_Click" />                               		
				        </p>
                <div style="margin-left:10px;">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>	                					
                <div style="width:820px">
                    <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_ItemDataBound" OnDataBound="ListView1_DataBound"  >
                        <ItemTemplate>
                            <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                                <td>
                                    Parent : <span style="color:blue"><%#Eval("parent_id")%></span>
                                    <table cellpadding="0" cellspacing="0" border="0" style="margin:0px;">
                                        <tr style="height:16px;">
                                            <td>primray_int</td>
                                            <td>integer unicode label</td>
                                            <td>secondary_id</td>
                                            <td>non integer unicode label</td>
                                        </tr>
                                        <tr style="height:16px;">
                                            <td style="text-align:center"><%#Eval("primary_int")%></td>
                                            <td style="text-align:center"><%#Eval("label_int")%></td>
                                            <td><%#Eval("secondary_id") %></td>
                                            <td><%#Eval("label_non_int") %></td>
                                        </tr>
                                    </table>
                                    <div style="width:100%">
                                        <div style="padding:5px; margin:5px 0px; background-color:#f1f2f3">
                                            <b>Description</b>
                                            <div style="margin-left:20px;margin-bottom:15px;">
                                                <%#Eval("description")%>
                                            </div>
                                            <b>Information</b>
                                            <div style="margin-left:20px;">
                                                <%#Eval("information")%>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td style="text-align:center" id="td_status" runat="server"></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                                <br />
                                <p>ไม่พบรายการ OID</p>
                                <br />
                            </div>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div style="border:0px solid black">
                                <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                    <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellspacing="1"  runat="server"  width="100%">
                                        <tr style="background-color:#e1e0f1; height:22px;">
                                            <td class="th" >node_info</td>
                                            <td class="th" style="width:150px">status</td>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                    <br />                                
                                </div>
                            </div>                                              
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT * FROM [node_request_batch] WHERE batch_file=@file ORDER BY batch_item">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="file" SessionField="batch_file" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div id="divImport" runat="server" visible="false">
                        <p class="no-border" >
                            <asp:Button ID="Button2" runat="server" Text="บันทึกข้อมูล" CssClass="button" Width="120px" Height="26px" OnClick="Button2_Click"  />                               		
				        </p>
                </div>
            </div>				
		<!-- main ends -->	
		</div>
</asp:Content>
