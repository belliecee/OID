
<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" Inherits="OIDMaster.oids" Codebehind="oids.aspx.cs" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .statictext {
	        margin: 3px 0;
	        padding: 3px;
            border:1px solid #f1f2f3;
            color:#444444;
            font-size:9pt;
            font-family:'Courier New';
            background-color:#f1f2f3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="bodytopmainPan">
<div id="bodytopPan">
    <table width="100%">
        <tr>
            <td width="50%">
                <!--
                กิ่งหลัก : &nbsp;<asp:DropDownList ID="ddlRA"  runat="server" Height="22px" 
                    Width="346px" DataSourceID="SqlDataSource1" DataTextField="notation" DataValueField="node_id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" 
                    SelectCommand="SELECT node_id, (CAST(notation1 AS nvarchar(4000)) + ' ' + secondary_id + ' (' + CONVERT(varchar(10),primary_int) + ')') as notation FROM [node] WHERE node_id=1 or node_parent_id=1"></asp:SqlDataSource>
                -->
            </td>
            <td align="right">
                    <div>
                        แสดงข้อมูล OID: <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click" />
                    </div>  
            </td>            
        </tr>
    </table>
     
</div><br />
</div>
<div id="bodymainmiddlePan">
  <div id="bodymiddlePan">
 
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div style="margin:10px 0px;border:0px solid black; ">
        <div style="margin:10px 0px;">
            <div style="font-weight:bold;font-size:13pt;">OID Display in tree</div> 

            <div style="margin-top:15px; width:100%; ">

                <div style="border:0px solid black; width:425px; float:left; color:#333">
                    <div style="margin-bottom:5px;">
                    <div style="color:blue;">
                        <asp:Label ID="lblRootNode" runat="server"></asp:Label>
                    </div>
                    <div style="margin:5px auto">
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Expand All</asp:LinkButton> | 
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Collapse All</asp:LinkButton>
                    </div>
                </div>
                    <obout:Tree ID="Tree1" runat="server"  CssClass="msdn" DataSourceID="SqlDataSource2" 
                        OnTreeNodeDataBound="Tree1_TreeNodeDataBound" Width="420px" OnSelectedTreeNodeChanged="Tree1_SelectedTreeNodeChanged" >
                        <DataBindings>
                            <obout:NodeBinding DataSourceColumnID="node_id" DataSourceColumnParentID="node_parent_id"
                                Expanded="true" />
                        </DataBindings>
                    </obout:Tree>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>"
                        ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>"
                        SelectCommand="SELECT * FROM [node] WHERE [node_status]=1" ></asp:SqlDataSource>

                </div>
                <div style="float:right; border:0px solid #cccccc; width:520px; color:#333">
                    <div style="margin:5px 10px;">
                        <b>ชื่อตัวระบุวัตถุ (Object Identifier : OID) </b> 
                        <div style="font-size:11pt;">
                            <asp:Label ID="lblNodeID" runat="server" ForeColor="Blue" ></asp:Label>
                        </div>
                    </div>				
                    <div style="margin-top:10px;">		
			            <div style="margin:0px 15px;">
                            <div>ASN.1 Notation</div>
                            <div><asp:TextBox ID="txtNotation1" runat="server" Width="400px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div>dot Notation</div>
                            <div><asp:TextBox ID="txtNotation2" runat="server" Width="400px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div>OID-IRI Notation</div>
                            <div><asp:TextBox ID="txtNotation3" runat="server" Width="400px" ReadOnly="true"  CssClass="statictext"></asp:TextBox></div>
                            <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			            </div>
                    </div>		
                
                    <div style="margin-top:20px;">
 			            <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ข้อมูลของมาตรฐานที่ลงทะเบียน (OID Information)</div>			
			            <div style="margin:0px 15px;">
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
			            <div style="margin:0px 15px;">
                            <div>Information</div>
                            <div style="background-color:#f1f2f3; min-height:80px;">
                                <div style="margin:8px 8px 8px 40px; font-family:'Courier New'">
                                    <asp:Label ID="lblInformation" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div>Description</div>
                            <div style="background-color:#f1f2f3; min-height:80px;">
                                <div style="margin:8px 8px 8px 40px; font-family:'Courier New'">
                                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			            </div>
                        <br />
                        <br />
                        <br />
                    </div>	


                </div>

            </div>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </div>

        </ContentTemplate>
    </asp:UpdatePanel>




  </div>
</div>
    

</asp:Content>

