

<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="rejectReason" Codebehind="rejectReason.aspx.cs" %>

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
        .auto-style1 {
            width: 147px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodytopmainPan">
<div id="bodytopPan">
    <table>
        <tr>
            <td width="300">
                เลขที่ : <b><asp:Label ID="lblID" runat="server" ForeColor="#3333CC"></asp:Label></b>
            </td>
            <td width="350">
                 
            </td>
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
                <div style="font-weight:bold;margin-left:5px;">ข้อมูลเหตุผลการที่ไม่ผ่านการอนุมัติ</div>
                <div style="margin-top:10px;">
                    <table>
                        <tr>
                            <td class="auto-style1">ลำดับที่</td>
                            <td>
                                <asp:TextBox ID="t11" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">เหตุผล</td>
                            <td>
                                <asp:TextBox ID="t12" runat="server" Width="300px" MaxLength="120" CssClass="text_input0" ReadOnly="true" ForeColor="#FF6600"></asp:TextBox></td>
                        </tr>
                        <!--
                        <tr>
                            <td>โทรศัพท์</td>
                            <td>
                                <asp:TextBox ID="t14" runat="server" Width="200px" MaxLength="120" CssClass="text_input0" ReadOnly="true">02251 4681-7 #107 </asp:TextBox></td>
                        </tr> -->
                        </table>
                </div>
               
                </div>
               
                <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ข้อมูลขององค์กร (Organization Information)</div>
          
                <div style="margin:20px 5px; border-top:1px dotted #999; width:510px;padding-top:15px;" id="divApprove" runat="server" visible="false">
                    <asp:Button ID="btnApprove" runat="server"  Text="อนุมัติ" Width="120px" OnClick="Approve_Click"   />
                    &nbsp;
                    <asp:Button ID="btnReject" runat="server"  Text="ไม่อนุมัติ" Width="120px" OnClick="Reject_Click"   />
                    <br />
                    <br />
                </div>
            </div>

        </div>

    </div>   

  </div>
</div>


</asp:Content>

