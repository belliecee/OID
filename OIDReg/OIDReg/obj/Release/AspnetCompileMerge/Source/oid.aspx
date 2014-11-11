<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="oid.aspx.cs" Inherits="OIDReg.oid" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:HiddenField ID="NodeID" runat="server" />
		<div id="main">
            <div>
                <div style="margin:0px 10px;">
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
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ส่วนที่ 3 ข้อมูลของมาตรฐานที่จะลงทะเบียน (OID Information)</div>			
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

                <div style="margin-top:20px;">
 			        <div style="font-weight:bold; margin-left:10px;margin-bottom:10px;">ข้อมูลผู้ลงทะเบียน (First Registration Authority)</div>			
			        <div style="margin-left:10px;">
                        <div>ชื่อหน่วยงาน (ภาษาไทย)</div>
                        <div><asp:TextBox ID="t1" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox></div>
                        <div>ชื่อหน่วยงาน (ภาษาอังกฤษ)</div>
                        <div><asp:TextBox ID="t2" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox></div>
                        <div>กระทรวง</div>
                        <div><asp:TextBox ID="t3" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox></div>
                        <div>email</div>
                        <div><asp:TextBox ID="t4" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox></div>
                        <div>website</div>
                        <div><asp:TextBox ID="TextBox1" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox></div>
                        <div>โทรศัพท์</div>
                        <div><asp:TextBox ID="TextBox2" runat="server" Width="300px" MaxLength="250" CssClass="inputtext"></asp:TextBox></div>
                        <div>ที่ตั้ง</div>
                        <div><asp:TextBox ID="TextBox3" runat="server" Width="436px" MaxLength="250" CssClass="inputtext" Height="55px" TextMode="MultiLine"></asp:TextBox></div>
                        <div style="margin-top:10px; border-bottom:1px dashed #cccccc;"></div>
			        </div>
                </div>	
                <p class="no-border">
                    หมายเลขโอไอดีที่ถูกลงทะเบียนเพื่อใช้ระบุวัตถุ จะไม่ถูกนำมาใช้ซ้ำ สำนักมาตรฐาน สำนักงานพัฒนาอุตสาหกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน) จะเป็นผู้ดูแลและปรับปรุงข้อมูลทะเบียนหมายเลขโอไอดีภายใต้กิ่ง etda(1) เป็นระยะๆ โดยสามารถดูรายละเอียดเพิ่มเติมได้จาก URL: http://standard.etda.or.th
                </p>
				        <p class="no-border" style="display:none">
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" Width="100px"   />     		
				        </p>
                <div style="margin-left:10px;">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>	                					
            </div>				
		<!-- main ends -->	
		</div>
				
    <uc1:Sidebar1 runat="server" ID="Sidebar1" />

</asp:Content>
