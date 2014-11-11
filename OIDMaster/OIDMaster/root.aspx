

<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="root" Codebehind="root.aspx.cs" %>


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
                รายการกิ่งหลักเลขที่ : <b><asp:Label ID="lblID" runat="server" ForeColor="#3333CC"></asp:Label></b>
            </td>
            <td width="350">
                &nbsp;</td>
            <td >
                &nbsp;</td>            
        </tr>
    </table>
     
</div><br />
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
 
<div style="text-align:left;padding:0px 0px; font-family:'Segoe UI'">
        <div style="border-left:1px solid #ccc;">
            <div id="mainform">
                <div style="font-weight:bold;margin-left:5px;">ข้อมูลของกิ่งหลัก&nbsp; (Root Node Information)</div>
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
                        
            </div>


            <div style="margin:30px 30px; border-top:1px dashed #ccc;color:#666">               
                    
                <div style="margin:15px 5px;" id="divStaff" runat="server" visible="true">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:Button ID="btnSave" runat="server"  Text="บันทึก" Width="120px"   />&nbsp;
                                <asp:Button ID="btnBack" runat="server"  Text="ย้อนกลับ" Width="120px"   />&nbsp;
                                &nbsp;
                                &nbsp;
                            </td>
                            <td width="200" align="right">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
               
            </div>

            <div style="margin:30px 30px;color:#666">
              
            </div>
        </div>

    </div>   

  </div>
</div>


</asp:Content>

