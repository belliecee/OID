<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Manage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OIDReg.Manage.Default" %>

<%@ Register Src="~/Manage/Sidebar2.ascx" TagPrefix="uc1" TagName="Sidebar2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #registrant {
            margin-top:20px;
        }

        #registrant table {
            border-collapse:collapse;
            width:97%;
        }

        #registrant td {
            padding:5px;
            background-color:#f1f2f3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <asp:HiddenField ID="hidOID" runat="server" />
        <div>
                <div id="registrant">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;font-size:11pt;">ข้อมูลของหน่วยงานที่ลงทะเบียน (First Registration Authority)</div>			
			        <div style="margin-left:0px;margin-right:0px">
                        <table>
                            <tr>
                                <td width="20%">ชื่อหน่วยงาน</td>
                                <td><asp:Label ID="lblName" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>ที่อยู่</td>
                                <td><asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td><asp:Label ID="lblPhone" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                            </tr>
                        </table>
			        </div>
                    <div style="margin-top:10px;">		
			            <div style="margin-left:10px;">
                            <div>ASN.1 Notation</div>
                            <div><asp:TextBox ID="txtNotation1" runat="server" Width="500px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div>dot Notation</div>
                            <div><asp:TextBox ID="txtNotation2" runat="server" Width="500px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div>OID-IRI Notation</div>
                            <div><asp:TextBox ID="txtNotation3" runat="server" Width="500px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			            </div>
                    </div>		
                
                    <div style="margin-top:20px;">
 			            <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ข้อมูลของมาตรฐานที่ลงทะเบียน (OID Information)</div>			
			            <div style="margin-left:10px;">
                            <div>ค่าจำนวนเต็มปฐมภูมิ (Primary integer value)</div>
                            <div><asp:TextBox ID="txtOIDInt" runat="server" Width="80px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div>ป้ายชื่อยูนิโค๊ดแบบจำนวนเต็ม (integer-valued Unicode Label)</div>
                            <div><asp:TextBox ID="txtOIDLabel" runat="server" Width="80px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div>ตัวระบุวัตถุแบบทุติยภูมิ (Secondary identifier)</div>
                            <div><asp:TextBox ID="txtOIDSecondary" runat="server" Width="300px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div>ป้ายชื่อยูนิโค๊ดแบบที่ไม่ใช่จำนวนเต็ม (Non-integer Unicode label)</div>
                            <div><asp:TextBox ID="txtUnicodeLabel" runat="server" Width="300px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			            </div>
                    </div>	

                    <div style="margin-top:20px;">
 			            <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ข้อมูลเพิ่มเติมของตัวระบุวัตถุ (Information)</div>			
			            <div style="margin-left:10px;">
                            <div>Information</div>
                            <div style="background-color:#f1f2f3; min-height:80px;">
                                <div style="margin:8px 8px 8px 20px; font-family:'Courier New'">
                                    <div style="padding:8px 0px;">
                                        <asp:Label ID="lblInformation" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div>Description</div>
                            <div style="background-color:#f1f2f3; min-height:80px;">
                                <div style="margin:8px 8px 8px 20px; font-family:'Courier New'">
                                    <div style="padding:8px 0px;">
                                        <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			            </div>
                    </div>
                </div>
				<p class="no-border">
                    <asp:Button ID="Button1" runat="server" Text="แก้ไขข้อมูล" CssClass="button" Width="100px" Height="26px" OnClick="Button1_Click"   />    &nbsp;
                    <asp:Button ID="Button2" runat="server" Text="เพิ่มกิ่ง" CssClass="button" Width="68px" Height="26px" OnClick="Button2_Click"/> 		
				</p>
        </div>
    </div>
    <uc1:Sidebar2 runat="server" id="Sidebar2" />
</asp:Content>
