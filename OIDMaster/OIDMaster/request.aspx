<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="request" Codebehind="request.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #mainform {
            margin-left:30px;
            font-size:11pt;
        }

        #mainform table {
            /* margin:0 auto;  align (center) */
            border-collapse: separate;
            border-spacing:1px;
        }

        #mainform th, td {
            padding:4px;
            vertical-align:top;
        }
        .text_input0 {
            border:1px solid #999;
            padding-left:4px;
            padding-right:4px;
            padding-top:5px;
            padding-bottom:5px;
        }
        .text_input1 {
            border:1px solid #999;
            padding-left:4px;
            padding-right:4px;
            padding-top:5px;
            padding-bottom:5px;
            text-align:center;
        }
        .bnt_disable {
            background-color: #cccccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodytopmainPan">
<div id="bodytopPan">
    <table>
        <tr>
            <td width="300">
                รายการคำขอเลขที่ : <b><asp:Label ID="lblID" runat="server" ForeColor="#3333CC"></asp:Label></b>
            </td>
            <td width="350">
                วันที่บันทึกคำร้อง : <b><asp:Label ID="lblDate" runat="server" ForeColor="#3333CC"></asp:Label></b>
            </td>
            <td >
                สถานะ : <b><asp:Label ID="lblStatus" runat="server" ForeColor="#3333CC"></asp:Label></b>
            </td>            
        </tr>
    </table>
     
</div><br />
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
 
<div style="text-align:left;padding:0px 0px; font-family:'Segoe UI'">
        <div style="border-left:1px solid #ccc;">
            <div id="mainform">
                <div style="font-weight:bold;margin-left:5px;">ข้อมูลของผู้ยื่นคำร้อง หรือ ผู้ดำเนินการของหน่วยงาน&nbsp; (Applicant or Organization Operator Information)</div>
                <div style="margin-top:10px;">
                    <table>
                        <tr>
                            <td style="width:275px;">ชื่อ-นามสกุล (ภาษาไทย)</td>
                            <td>
                                <asp:TextBox ID="t11" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>ชื่อ-นามสกุล (ภาษาอังกฤษ)</td>
                            <td>
                                <asp:TextBox ID="t12" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>อีเมล</td>
                            <td>
                                <asp:TextBox ID="t13" runat="server" Width="300px" MaxLength="500" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <!--
                        <tr>
                            <td>โทรศัพท์</td>
                            <td>
                                <asp:TextBox ID="t14" runat="server" Width="200px" MaxLength="120" CssClass="text_input0" ReadOnly="true">02251 4681-7 #107 </asp:TextBox></td>
                        </tr> -->
                        <tr style="vertical-align:top">
                            <td>เบอร์โทรศัพท์</td>
                            <td>
                                <asp:TextBox ID="t34" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
                <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ข้อมูลของผู้มีสิทธิ์อนุมัติของหน่วยงาน (Organization Approver Information)</div>
                 <div style="margin-top:10px;">
                    <table>
                        <tr>
                            <td style="width:275px;">ชื่อ-นามสกุล (ภาษาไทย)</td>
                            <td>
                                <asp:TextBox ID="t31" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>ชื่อ-นามสกุล (ภาษาอังกฤษ)</td>
                            <td>
                                <asp:TextBox ID="t32" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>อีเมล</td>
                            <td>
                                <asp:TextBox ID="t33" runat="server" Width="300px" MaxLength="500" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        </table>
                </div>
               
                <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ข้อมูลขององค์กร (Organization Information)</div>
                <div style="margin-top:10px;">
                    <table>
                        <tr>
                            <td style="width:275px;">ชื่อหน่วยงาน (ภาษาไทย)</td>
                            <td>
                                <asp:TextBox ID="t21" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>ชื่อหน่วยงาน (ภาษาอังกฤษ)</td>
                            <td>
                                <asp:TextBox ID="t22" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>สังกัด</td>
                            <td>
                                <asp:TextBox ID="t23" runat="server" Width="300px" MaxLength="500" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>อีเมล</td>
                            <td>
                                <asp:TextBox ID="t24" runat="server" Width="300px" MaxLength="500" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>เว็บไซต์</td>
                            <td>
                                <asp:TextBox ID="t25" runat="server" Width="300px" MaxLength="500" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>โทรศัพท์</td>
                            <td>
                                <asp:TextBox ID="t26" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>โทรสาร</td>
                            <td>
                                <asp:TextBox ID="t27" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr style="vertical-align:top">
                            <td>ที่ตั้งหน่วยงาน</td>
                            <td>
                                <asp:TextBox ID="t28" runat="server" Width="403px" CssClass="text_input0" TextMode="MultiLine" Height="80px" MaxLength="1000" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
                <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ข้อมูลของมาตรฐานที่จะลงทะเบียน (OID Information)</div>
                <div style="margin-top:10px;">
                    <table>
                        <tr>
                            <td width="275">ค่าจำนวนเต็มปฐมภูมิ (Primary Integer)</td>
                            <td style="padding-bottom:10px;">
                                <asp:TextBox ID="t40" runat="server" Width="80px" MaxLength="10" CssClass="text_input1" ReadOnly="true"   ForeColor="Blue"  ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td width="275">ค่าทุติยภูมิ (Secondary Identifier)</td>
                            <td>
                                <asp:TextBox ID="t41" runat="server" Width="300px" MaxLength="100" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>ป้ายชื่อ ยูนิโค๊ดแบบที่ไม่ใช่จำนวนเต็ม (Non-integer Unicode label)</td>
                            <td>
                                <asp:TextBox ID="t42" runat="server" Width="300px" MaxLength="100" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>คำอธิบาย (Description)</td>
                            <td>
                                <asp:TextBox ID="t43" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>ข้อมูลเพิ่มเติม (Information)</td>
                            <td>
                                <asp:TextBox ID="t44" runat="server" Width="403px" CssClass="text_input0" TextMode="MultiLine" Height="80px" MaxLength="1000" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td>ต้องการลงทะเบียนอยู่ภายใต้กิ่ง</td>
                            <td>
                                <asp:HiddenField ID="hidParentID" runat="server" />
                                <asp:Label ID="lblParentNode" runat="server" ForeColor="#FF6600"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin:30px 0px;color:#666">
                <div>
                    <div style="font-weight:bold;margin-left:5px; margin-top:25px;">เอกสารประกอบการลงทะเบียน</div>
                </div>
                <div>
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="ListView2_ItemDataBound"     >
                        <ItemTemplate>
                            <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                                <td id="td_no" runat="server" style="text-align:center"></td>
                                <td style="text-align:left;">
                                    <%#Eval("type_name")%>
                                     <div style="margin:8px auto"> <a href="<%=FileURL%><%#Eval("doc_file_name2")%>"><%#Eval("doc_file_name1")%></a></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                                <br />
                                <br /><br />ไม่มีไฟล์เอกสาร<br /><br /><br />
                            </div>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div style="border:0px solid black">
                                <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                    <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellspacing="1"  runat="server"  width="100%">
                                        <tr style="background-color:#e1e0f1; height:22px;">
                                            <td class="th" style="width:80px">ลำดับที่</td>
                                            <td class="th" >ไฟล์เอกสาร</td>                        
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                    <br />                                
                                </div>
                            </div>                                               
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT * from register_document inner join register_document_type on doc_type_id=type_id where doc_reqid=@reqid">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hidReqID" Name="reqid" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            </div>


            <div style="margin:30px 30px; border-top:1px dashed #ccc;color:#666">
                <div>
                    <div style="margin-bottom:10px;">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                    <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ความเห็นเจ้าหน้าที่</div>
                </div>
                <div style="margin-left:5px;">
                    <asp:HiddenField ID="hidReqID" runat="server" />
                    <asp:TextBox ID="txtRemark" runat="server" Width="500px" CssClass="text_input0" TextMode="MultiLine" Height="85px" MaxLength="2000" Font-Size="Medium"  ></asp:TextBox>
                </div>
                <div style="margin-top:10px;margin-left:5px;">
                    กรณีคำขอไม่ผ่านการอนุมัติหรือต้องการยกเลิก กรุณาระบุเหตุผล
                    <div>
                        <asp:DropDownList ID="ddlReject" runat="server" style="border:1px solid #999; padding-top:3px; padding-bottom:3px;" Width="513px" DataSourceID="SqlDataSource2" DataTextField="reason_desc" DataValueField="reason_id" OnDataBound="ddlReject_DataBound" ></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT [reason_id], [reason_desc] FROM [reject_reason]" OnSelected="SqlDataSource2_Selected" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
                    </div>
                </div>
                <div style="margin:15px 5px;" id="divStaff" runat="server" visible="true">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:Button ID="btnForward" runat="server"  Text="ตรวจสอบผ่าน" Width="120px" OnClick="Forward_Click"   />&nbsp;
                                <asp:Button ID="btnDecline" runat="server"  Text="ตรวจสอบไม่ผ่าน" Width="120px" OnClick="Decline_Click"   />&nbsp;
                                <asp:Button ID="btnCancel" runat="server"  Text="ยกเลิกคำร้อง" Width="120px" OnClick="Cancel_Click"   />&nbsp;
                                <asp:Button ID="btnFinal" runat="server"  Text="ใช้งานได้" Width="120px" OnClick="Commit_Click"   />&nbsp;
                            </td>
                            <td width="200" align="right">
                                <asp:Button ID="btnDelete" runat="server"  Text="ลบคำร้อง" Width="120px" OnClick="btnDelete_Click"    />&nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin:20px 5px; border-top:1px dotted #999; width:510px;padding-top:15px;" id="divApprove" runat="server" visible="false">
                    <asp:Button ID="btnApprove" runat="server"  Text="อนุมัติ" Width="120px" OnClick="Approve_Click"   />&nbsp;
                    <asp:Button ID="btnReject" runat="server"  Text="ไม่อนุมัติ" Width="120px" OnClick="Reject_Click"   /><br /><br />
                </div>
            </div>

            <div style="margin:30px 30px;color:#666">
                <div>
                    <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ประวัติการพิจารณา</div>
                </div>
                <div>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound"    >
                        <ItemTemplate>
                            <tr valign="top"  id="tr_item" runat="server" style="background-color:#fff">
                                <td><%#Eval("act_date") %></td>
                                <td style="text-align:center;">
                                    <%#Eval("user_name") %>
                                </td>
                                <td style="text-align:center;">
                                    <%#Eval("action_name")%>
                                </td>
                                <td style="text-align:left" id="td_detail" runat="server"><%#Eval("act_remark") %></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                                <br />
                                <br /><br /><br /><br /><br />
                            </div>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div style="border:0px solid black">
                                <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                    <table ID="itemPlaceholderContainer" style="background-color:#506c09" cellspacing="1"  runat="server"  width="100%">
                                        <tr style="background-color:#e1e0f1; height:22px;">
                                            <td class="th" style="width:100px">วันที่</td>
                                            <td class="th" style="width:120px">ผู้ทำรายการ</td>
                                            <td class="th" style="width:180px">action</td>
                                            <td class="th" >ความเห็น</td>                                            
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                    <br />                                
                                </div>
                            </div>                                               
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT * FROM [register_log] 
	INNER JOIN [user] ON [register_log].[act_by] = [user].[user_id] 
	INNER JOIN [user_action] ON  [register_log].[act_action_id] = [user_action].[action_id]
    LEFT OUTER JOIN [reject_reason] ON [register_log].[act_reject_id] = [reject_reason].[reason_id]
WHERE act_regid=@regid
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hidReqID" Name="regid" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>

    </div>   

  </div>
</div>


</asp:Content>

