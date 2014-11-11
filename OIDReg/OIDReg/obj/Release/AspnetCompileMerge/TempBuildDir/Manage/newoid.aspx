<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Manage.Master" AutoEventWireup="true" CodeBehind="newoid.aspx.cs" Inherits="OIDReg.Manage.newoid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:HiddenField ID="NodeID" runat="server" />
		<div id="main">
            <div>
                <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;font-size:11pt;">บันทึกข้อมูลกิ่งใหม่</div>	
                <div style="margin:0px 10px;display:none">
                    <b>Full Path</b> 
                    <div id="divParent" runat="server" style="margin-bottom:0px;font-size:11pt;"></div>
                </div>
                <div style="margin:5px 10px;">
                    <b>กิ่งต้นทาง (Parent Object Identifier) </b> 
                    <div style="font-size:11pt;">
                        <asp:HiddenField ID="RootID" runat="server" />
                        <asp:HiddenField ID="RootNode" runat="server" />
                        <asp:TextBox ID="txtRoot" runat="server" Width="300px" ReadOnly="true"   ></asp:TextBox>
                    </div>
                </div>					
                
                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ข้อมูลของมาตรฐานโอไอดี (OID Information)</div>			
			        <div style="margin-left:10px;">
                        <div>ค่าจำนวนเต็มปฐมภูมิ (Primary integer value)</div>
                        <div><asp:TextBox ID="txtOIDInt" runat="server" Width="80px" MaxLength="10" ToolTip="การกำหนดค่าจำนวนเต็มปฐมภูมิให้เป็นไปตามเกณฑ์ที่หน่วยงานภายใต้ สพธอ. ควรกำหนดเป็นเลข Running ที่ไม่ซ้ำกัน" ></asp:TextBox></div>
                        <div>ป้ายชื่อยูนิโค๊ดแบบจำนวนเต็ม (integer-valued Unicode Label)</div>
                        <div><asp:TextBox ID="txtOIDLabel" runat="server" Width="80px" MaxLength="240" ToolTip="สำหรับป้ายชื่อยูนิโคดแบบจำนวนเต็มจะถูกกำหนดให้มีค่าเหมือนกับค่าจำนวนเต็มปฐมภูมิ"  ></asp:TextBox></div>
                        <div>ตัวระบุวัตถุแบบทุติยภูมิ (Secondary identifier)</div>
                        <div><asp:TextBox ID="txtOIDSecondary" runat="server" Width="300px" MaxLength="240" ToolTip="การกำหนดตัวระบุวัตถุแบบทุติยภูมิจะต้องสอดคล้องตามที่มาตรฐาน ITU-T X.660 กำหนดดังนี้
1 ต้องประกอบด้วยตัวอักษรภาษาอังกฤษ (A-Z, a-z) ตัวเลข (0-9) และเครื่องหมายยัติภังค์ “-” เท่านั้น
2 ต้องขึ้นต้นด้วยตัวอักษรภาษาอังกฤษพิมพ์เล็ก (a-z)
3 เครื่องหมายยัติภังค์ต้องไม่ใช้ลงท้ายและต้องไม่ใช้ติดกันสองตัว '--'"  ></asp:TextBox></div>
                        <div>ป้ายชื่อยูนิโค๊ดแบบที่ไม่ใช่จำนวนเต็ม (Non-integer Unicode label)</div>
                        <div><asp:TextBox ID="txtUnicodeLabel" runat="server" Width="300px"  MaxLength="240" ></asp:TextBox></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>	

                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ข้อมูลเพิ่มเติมของตัวระบุวัตถุ (Information)</div>			
			        <div style="margin-left:10px;">
                        <div>Information</div>
                        <div>
                            <asp:TextBox ID="txtInformation" TextMode="MultiLine" runat="server" Height="58px" Width="407px"></asp:TextBox>
                        </div>
                        <div>Description</div>
                        <div>
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Height="58px" Width="407px"></asp:TextBox>
                        </div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>	

                <p class="no-border">
                    หมายเลขโอไอดีที่ถูกลงทะเบียนเพื่อใช้ระบุวัตถุ จะไม่ถูกนำมาใช้ซ้ำ สำนักมาตรฐาน สำนักงานพัฒนาอุตสาหกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน) จะเป็นผู้ดูแลและปรับปรุงข้อมูลทะเบียนหมายเลขโอไอดีภายใต้กิ่ง etda(1) เป็นระยะๆ โดยสามารถดูรายละเอียดเพิ่มเติมได้จาก URL: http://standard.etda.or.th
                </p>
				        <p class="no-border" >
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" Width="100px" Height="26px" OnClick="Button1_Click"  />                               		
				        </p>
                <div style="margin-left:10px;">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>	                					
            </div>				
		<!-- main ends -->	
		</div>
				


</asp:Content>
