<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="displaytree.aspx.cs" Inherits="OIDReg.displaytree" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div style="margin:10px 40px;border:0px solid black;">
        <div style="margin:10px 15px;">
            <div style="font-weight:bold;font-size:13pt;">OID Display in tree</div> 
            <div style="margin-top:15px; width:100%; ">
                
                <div style="margin-bottom:5px;">
                    <div style="color:blue;">
                        <asp:Label ID="lblRootNode" runat="server"></asp:Label>
                    </div>
                    <div style="margin:5px auto">
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Expand All</asp:LinkButton> | 
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Collapse All</asp:LinkButton>
                    </div>
                </div>
                <div style="border:0px solid black; width:370px; float:left;">

                    <obout:Tree ID="Tree1" runat="server"  CssClass="msdn" DataSourceID="SqlDataSource1" 
                        OnTreeNodeDataBound="Tree1_TreeNodeDataBound" Width="420px" OnSelectedTreeNodeChanged="Tree1_SelectedTreeNodeChanged" >
                        <DataBindings>
                            <obout:NodeBinding DataSourceColumnID="node_id" DataSourceColumnParentID="node_parent_id"
                                Expanded="true" />
                        </DataBindings>
                    </obout:Tree>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>"
                        ProviderName="<%$ ConnectionStrings:LocalDatabase.ProviderName %>"
                        SelectCommand="SELECT * FROM [node] WHERE [node_status]=1" ></asp:SqlDataSource>

                </div>
                <div style="float:right; border:0px solid green; width:450px;">
                    
                <div style="margin:5px 10px;">
                    <b>ชื่อตัวระบุวัตถุ (Object Identifier : OID) </b> 
                    <div style="font-size:11pt;">
                        <asp:Label ID="lblNodeID" runat="server" ForeColor="Blue" ></asp:Label>
                    </div>
                </div>				
                <div style="margin-top:10px;">		
			        <div style="margin-left:10px;">
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



</asp:Content>
