
<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="cancel" Codebehind="cancel.aspx.cs" %>
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
        .text_input0 {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="bodytopmainPan">
<div id="bodytopPan">
    <table>
        <tr>
            <td width="300">
                รายการคำขอเลขที่ : <b><asp:Label ID="lblID" runat="server" ForeColor="#3333CC">12</asp:Label></b>
            </td>
            <td width="350">
                วันที่บันทึกคำร้อง : <b><asp:Label ID="lblDate" runat="server" ForeColor="#3333CC">16-08-2014 13:11:23</asp:Label></b>
            </td>
            <td >
                สถานะ : <b><asp:Label ID="lblStatus" runat="server" ForeColor="#3333CC">รอพิจารณา</asp:Label></b>
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
                <div style="font-weight:bold;margin-left:5px;">
                    <h2>ลบคำร้องขอจดทะเบียน</h2>
                </div>
                <div style="margin-top:10px;">
                </div>
            </div>


            <div style="margin:30px 30px; border-top:1px dashed #ccc;color:#666">
                <div>
                    <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ความเห็นเจ้าหน้าที่</div>
                </div>
                <div style="margin-left:5px;">
                    <asp:HiddenField ID="hidReqID" runat="server" />
                    <asp:TextBox ID="txtRemark" runat="server" Width="500px" CssClass="text_input0" TextMode="MultiLine" Height="85px" MaxLength="1000" ReadOnly="true"></asp:TextBox>
                </div>
                <div style="margin:15px 5px;" id="divStaff" runat="server" >
                    <asp:Button ID="btnForward" runat="server"  Text="ตกลง" Width="82px" />&nbsp;
                    <asp:Button ID="btnDecline" runat="server"  Text="ยกเลิก" Width="82px" />&nbsp;
                </div>
            </div>

            <div style="margin:30px 30px;color:#666">
                <div>
                    <div style="font-weight:bold;margin-left:5px; margin-top:25px;">ประวัติการพิจารณา</div>
                </div>
            </div>
        </div>

    </div>   

  </div>
</div>

</asp:Content>
