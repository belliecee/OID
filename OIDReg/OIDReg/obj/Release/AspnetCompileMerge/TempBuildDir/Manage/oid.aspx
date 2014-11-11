<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Manage.Master" AutoEventWireup="true" CodeBehind="oid.aspx.cs" Inherits="OIDReg.Manage.oid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:HiddenField ID="NodeID" runat="server" />
		<div id="main">
            <div>
                <div style="margin:0px 10px;display:none">
                    <b>Full Path</b> 
                    <div id="divParent" runat="server" style="margin-bottom:0px;font-size:11pt;"></div>
                </div>
                <div style="margin:5px 10px;">
                    <b>ชื่อตัวระบุวัตถุ (Object Identifier : OID) </b> 
                    <div style="font-size:11pt;">
                        <asp:Label ID="lblNodeID" runat="server" Text="th(764)" ForeColor="blue" ></asp:Label>
                    </div>
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
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ข้อมูลของมาตรฐานโอไอดี (OID Information)</div>			
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
                <div id="divEdit" runat="server">
				        <p class="no-border" >
                            <asp:Button ID="Button1" runat="server" Text="บันทึกการแก้ไข" CssClass="button" Width="122px" OnClick="Button1_Click" />&nbsp;
                            <asp:Button ID="Button2" runat="server" Text="เพิ่มกิ่ง" CssClass="button" Width="68px" OnClick="Button2_Click"  />
				        </p>
                </div>
                <div style="margin-left:10px;">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>	                					
            </div>				
		<!-- main ends -->	
		</div>

</asp:Content>
