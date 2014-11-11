<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="document.aspx.cs" Inherits="OIDReg.document" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #FileUpload {
            position:relative;
        }

        #BrowserVisible {
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 1;
            background:url(upload.png) 100% 1px no-repeat;
            width:345px;
            height:30px;
        }

        #FileField {
            width:250px;
            margin-right:85px;
            padding: 6px;
            font-size: 13px;
            background: #fff url('bg-form-field.gif') top left repeat-x;
            border: 1px solid #d5d5d5;
            color: #333;
            border-radius: 4px 4px 4px 4px !important;
        }

        #BrowserHidden {
            position:relative;
            width:345px;
            height:30px;
            text-align: right;
            -moz-opacity:0;
            filter:alpha(opacity: 0);
            opacity: 0;
            z-index: 2; 
        }
        #myFile {
            width: 433px;
        }

        .inputdropdown {
            padding-top:2px;
            padding-bottom:2px;
            padding-left:2px;   
            border:1px solid #333;         
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="main">
            <div>
			    <h2>แบบคำขอลงทะเบียน</h2>		
                <asp:HiddenField ID="hidRequestID" runat="server" />
			    <div  style="margin:5px 10px;">
                    <div style="font-weight:bold;">สำหรับผู้ยื่นคำร้องที่มีคุณสมบัติดังนี้</div>
                    เป็นหน่วยงานหรือเครือข่ายหน่วยงาน หรือองค์กรวิขาชีพ ที่เป็นนิติบุคคลตามกฎหมาย มีคณะบุคคลากรที่มีความสามารถ ความเชี่ยวชาญ และประสบการณ์ในงานมาตรฐานด้านธุรกรรมทางอิเล็กทรอนิกส์เฉพาะสาขารวมถึงทรัพยากรและโครงสร้างองค์กรที่มีความชัดเจนรองรับ
			    </div>

			    <div  style="margin:5px 10px;">
                    <div style="font-weight:bold;">เอกสารที่เกี่ยวข้องสำหรับ กิ่ง <asp:Label ID="lblRoot" runat="server" ForeColor="Red"></asp:Label></div>
                    <div id="div1" runat="server">
                        <ul>
                            <li>สำเนาหนังสือรับรองการจดทะเบียนนิติบุคคล หรือเอกสารแสดงสถานะการเป็นนิติบุคคล หรือหนังสือราชการที่ลงนามโดยผู้มีอำนาจลงนามของหน่วยงาน  </li>
                            <li>เอกสารมาตรฐานที่เกี่ยวกับการทำธุรกรรมทางอิเล็กทรอนิกส์ซึ่งมีการใช้งานในระดับประเทศ ได้แก่ มาตรฐานธุรกรรมทางอิเล็กทรอนิกส์ซึ่งประกาศโดยคณะกรรมการธุรกรรมทางอิเล็กทรอนิกส์ ข้อเสนอแนะมาตรฐานเทคโนโลยีสารสนเทศและการสื่อสารที่จำเป็นต่อธุรกรรมทางอิเล็กทรอนิกส์ซึ่งประกาศโดย สพธอ. หรือมาตรฐานอื่น ๆ </li>
                        </ul>

                    </div>
                    <div id="div2" runat="server" visible="false">
                        <ul>
                            <li>สำเนาหนังสือรับรองการจดทะเบียนนิติบุคคล หรือเอกสารแสดงสถานะการเป็นนิติบุคคล หรือหนังสือราชการที่ลงนามโดยผู้มีอำนาจลงนามของหน่วยงาน  </li>
                            <li>สำเนาหนังสือรับรองการจดทะเบียนนิติบุคคล หรือเอกสารแสดงสถานะการเป็นนิติบุคคล หรือหนังสือราชการที่ลงนามโดยผู้มีอำนาจลงนามของหน่วยงาน  </li>
                            <li>เอกสารที่แสดงว่ามีการนำมาตรฐานไปใช้งานในกลุ่มหรือเครือข่าย  </li>
                        </ul>
                    </div>
			    </div>
			
                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">นำส่งเอกสารประกอบการพิจารณา</div>			
			        <div style="margin-left:10px;">

                        <div>ประเภทไฟล์เอกสาร</div>
                        <div>
                            <asp:DropDownList ID="ddlFileType" runat="server" Height="22px" Width="347px" CssClass="inputdropdown" 
                                DataSourceID="SqlDataSource1" DataTextField="type_name" DataValueField="type_id"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT [type_id], [type_name] FROM [register_document_type]"></asp:SqlDataSource>
                        </div>
                        <div>เลือกไฟล์</div>
                        <div>
                            <input type="file" id="myFile" name="myFile" style="height:21px;" />
                        </div>


                        <div style="margin-top:8px;">
                            <asp:Button runat="server" ID="btnUpload" CssClass="button"  Text="Upload" OnClick="btnUpload_Click" Width="86px" />
                        </div>

                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>		
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                <div style="margin-left:10px; margin-top:10px;">


                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2"   >
                        <ItemTemplate>
                            <tr valign="top"  id="tr_item" runat="server">
                                <td><%#Eval("doc_date") %></td>
                                <td><%#Eval("type_name")%></td>
                                <td><%#Eval("doc_file_name1")%></td>
                                <td style="text-align:center">
                                    <asp:LinkButton ID="LinkButton1" runat="server">ลบเอกสาร</asp:LinkButton></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div style="width:100%; background-color:#f1f2f3;text-align:center;">
                                <br />
                                <p>ยังไม่มีไฟล์เอกสาร</p> <br />
                            </div>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div style="border:0px solid black; color:#333">
                                <div style="background-color:#ffffff;border-bottom:1px solid #cccccc;text-align:center;">
                                    <table ID="itemPlaceholderContainer"  runat="server"  width="100%">
                                        <tr style="background-color:#e1e0f1; height:22px;">
                                            <td class="th" style="width:80px">Date/Time</td>
                                            <td class="th" style="width:100px">ประเภทเอกสาร</td>
                                            <td class="th">Info</td>
                                            <td class="th" style="width:60px"></td>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                    <br />                                
                                </div>
                            </div> 
                        </LayoutTemplate>
                    </asp:ListView>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LocalDatabase %>" SelectCommand="SELECT * FROM [register_document] INNER JOIN [register_document_type] 
ON doc_type_id = type_id
WHERE doc_reqid=@reqid">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hidRequestID" Name="reqid" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>                             					
                            <div style="text-align:center;">
				                <p class="no-border">
                                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" Width="100px" OnClick="Button1_Click"  />     		
				                </p>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </div>				
		<!-- main ends -->	
    </div>
    <uc1:Sidebar1 runat="server" ID="Sidebar1" />
</asp:Content>
