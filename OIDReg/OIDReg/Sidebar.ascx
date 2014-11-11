<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="OIDReg.Sidebar" %>
		<div id="sidebar">
		
			<h3>Display OID</h3>	
			
			<div>
			<p>
			<label for="qsearch">OID:</label>
                <asp:TextBox ID="Search1" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/search.gif" OnClick="ImageButton1_Click" />
			</p>
			</div>
			
			<h3>Sidebar Menu</h3>
			<ul class="sidemenu">				
				<li><a href="default.aspx">หน้าแรก</a></li>
				<li><a href="default.aspx#TemplateInfo">นิยาม</a></li>
				<li><a href="default.aspx">คุณสมบัติของผู้ยื่นคำร้อง</a></li>
				<li><a href="default.aspx">ขั้นตอนการพิจารณาลงทะเบียนหมายเลข โอไอดี</a></li>
				<li><a href="default.aspx" title="Web Templates">หลักเกณฑ์สำหรับโครงสร้างหมายเลขโอไอดีของ สพธอ.</a></li>
			</ul>

         <h3>เอกสารอ้างอิง</h3>
			<ul class="sidemenu">
            <li><a href="#" title="Themeforest">ประกาศสำนักงานพัฒนาธุรกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน) ฉบับที่ 12 (พ.ศ. 2557) <br />
               <span>หลักเกณฑ์และขั้นตอนการลงทะเบียนสำหรับโครงสร้างหมายเลขโอไอดี ของสำนักงานพัฒนาธุรกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน)</span></a>
            </li>
            <li><a href="#" title="4Templates">Recommenation ITU-T X.660 | International Standard ISO/IEC 9834-1 <br />
               <span>Information technology - Procedure for the operation of object identifier registration authorites: General procedures and top arcs of the international object identifier tree, July 2011.</span></a>
            </li>
            <li><a href="#" title="Templatemonster">ITU-T Handbook,<br />
               <span>"Object identifiers (OIDs) and their registration authorities</span>
            </a></li>
			</ul>
						
		<!-- sidebar ends -->		
		</div>	