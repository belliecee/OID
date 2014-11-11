<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OIDReg.Default1" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

		<div id="main">
				
			<a name="TemplateInfo"></a>
			<h2><a href="default.aspx" title="">Object identifier (OID) คืออะไร ?</a></h2>
					
			<p class="post-info">Posted by <a href="#">สำนักงานพัฒนาธุรกรรมทางอิเล็กทรอนิกส์</a> | Filed under <a href="index.html">มาตรฐาน</a>, <a href="index.html">internet</a></p>
				
         <p>
             เอกสาร Rec. ITU-T X.660 | ISO/IEC 9834-1 (07/2011) ได้ให้คำนิยามของวัตถุ (Object) และตัวระบุวัตถุ (Object identifier: OID) ไว้ในข้อ 3.5.10 และ 3.5.11 ตามลำดับ ดังนี้
<br><br><u><i>Object</i></u>&nbsp;:&nbsp;&nbsp;<i>“Anything in some world, generally the world of telecommunications and information processing or some part thereof, which is identifiable (can be named), and may be registered.”</i>
<br><u>วัตถุ</u>&nbsp;:&nbsp;&nbsp;สิ่งหนึ่งสิ่งใดในโลก ซึ่งในที่นี้จะหมายถึงโลกที่เกี่ยวกับการสื่อสารโทรคมนาคมและการประมวลผลข้อมูลสารสนเทศ โดยสิ่งนั้นสามารถถูกระบุด้วยชื่อและนำไปลงทะเบียนได้
<br><br><u><i>Object Identifier</i></u>&nbsp;:&nbsp;&nbsp;<i>“An ordered list of primary integer values from the root of the international object identifier tree to a node, which unambiguously identifies that node.”</i>
<br><u>ตัวระบุวัตถุ</u>&nbsp;:&nbsp;&nbsp;รายการลำดับของตัวเลขจำนวนเต็ม หรือ หมายเลขโอไอดี สำหรับระบุโหนดต่าง ๆ ในโครงสร้างตัวระบุวัตถุแบบต้นไม้ (international object identifier tree) ตั้งแต่โหนดต้นกำเนิด (Root) จนถึงโหนดที่ระบุวัตถุที่เจาะจงนั้น ๆ
             <br><center>(ตัวอย่าง: หมายเลขโอไอดีของ สพธอ. คือ 2.16.764.1)</center><br>
   
               <center><img src="/images/example.png" ></center><br>

             <div>
                <table border="1" cellspacing="0">
                    <tr style="vertical-align:top">
                        <td width="10%">2</td>
                        <td>กลุ่มการกำหนดมาตรฐานที่ร่วมกันของ องค์กรระหว่างประเทศว่าด้วยการมาตรฐานและคณะกรรมาธิการระหว่างประเทศว่าด้วยการมาตรฐานสาขาอิเล็กทรอนิกส์ (ISO/IEC) และ สหภาพโทรคมนาคมระหว่างประเทศ ภาคการกำหนดมาตรฐานโทรคมนาคม (ITU-T)
	                         <br><i>Common standardization area of ISO/IEC (International Organization for Standardization/International Electrotechnical Commission) and ITU-T (International Telecommunications Union - Telecommunication standardization sector)</i></td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>2.16</td>
                        <td>การลงทะเบียนในระดับประเทศ โดยมีการตกลงร่วมกันระหว่าง ITU-T และ ISO/IEC<br><i>Joint (ITU-T and ISO/IEC) registration within a country</i></td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>2.16.746</td>
                        <td>ประเทศไทย<br><i>Thailand</i></td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td> 2.16.764.1</td>
                        <td>สำนักงานพัฒนาธุรกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน) หรือ สพธอ. <br><i>Transactions Development Agency (Public Organization) or ETDA</i></td>
                    </tr>
                </table>
             </div>
            
             
             
         
         </p>

         <p>
             <div style="font-weight:bold;font-size:13pt;"> <b> Object identifier (OID) มีประโยชน์อย่างไร ?</b></div>
             <br>การกำหนดวัตถุทางสารสนเทศด้วยตัวระบุวัตถุ (Object identifier: OID) มีความสำคัญและเป็นโครงสร้างพื้นฐานด้านมาตรฐานที่สำคัญสำหรับใช้ในการระบุวัตถุทางสารสนเทศ เพื่อใช้ในการระบุวัตถุทุกอย่างด้วยชื่อที่เป็นเอกลักษณ์ในระดับสากล (globally unambiguous name) และเป็นชื่อเรียกถาวร (persistent name) ของวัตถุนั้นโดยจะไม่มีการนำชื่อหรือตัวระบุวัตถุมาใช้ซ้ำอีก
ทั้งนี้ ตัวระบุวัตถุสามารถอ้างอิงข้อมูลได้ทุกประเภทขึ้นอยู่กับขอบเขตความสนใจ โดยมีตัวอย่างการนำไปใช้ ดังนี้
<br><br> (1)&nbsp;&nbsp;เอกสารมาตรฐาน เช่น ITU-T Recommendation, ISO International Standard
<br> (2)&nbsp;&nbsp;ชื่อประเทศ ชื่อหน่วยงาน/องค์กร เช่น United States Department of Defense (DoD) <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;และชื่อโครงการ/ภารกิจ เช่น Internet ของ DoD
<br> (3)&nbsp;&nbsp;องค์ประกอบต่าง ๆ ในใบรับรองอิเล็กทรอนิกส์ (X.509 Certificate) หรือแนวนโยบายใบรับรอง<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อิเล็กทรอนิกส์ (Certificate Policy) ที่ใช้ในการระบุตัวตนอย่างมั่นคงปลอดภัย ซึ่งมีการเชื่อมกันกับ <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;schemas และ protocols ของ ITU-T X.500-based directory 
<br> (4)&nbsp;&nbsp;object class และ attribute type ต่าง ๆ ที่อยู่ใน schema ของ Lightweight directory access <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;protocol (LDAP)-based directory
<br> (5)&nbsp;&nbsp;การแลกเปลี่ยนข้อมูลด้านสุขภาพ เช่น มาตรฐาน Health Level 7 (HL7) ที่มีการกำหนด OID มากกว่า <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40,000 หมายเลขสำหรับการใช้งานของ e-health application ต่าง ๆ 
<br> (6)&nbsp;&nbsp;ชนิดอัลกอริทึมการเข้ารหัส (Encryption algorithms) เช่น SHA1 และตัวแปรต่าง ๆ ที่เกี่ยวข้อง เข่น <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;id-sha1, id-sha224, id-sha256
<br> (7)&nbsp;&nbsp;วิธีการระบุตัวตนสำหรับ tag-based applications (ตาม Rec. ITU-T X.668 | ISO/IEC 9834-9)
<br> (8)&nbsp;&nbsp;Abstract Syntax Notation One (ASN.1) module เช่น BioAPI Interworking Protocol และ<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วิธีการเข้ารหัสที่เกี่ยวข้อง (ASN.1 encoding rules)
<br> (9)&nbsp;&nbsp;Management Information Base (MIB) ต่าง ๆ สำหรับ Simple Network Management Protocol <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(SNMP) based systems 
<br>(10)&nbsp;ข้อความการแจ้งเตือน (Alerting messages) ใช้ในการเตือนภัยพิบัติ หรือใช้เตือนกรณีควบคุมดูแล<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ผู้ป่วยโดยอาศัย Common Alerting Protocol (CAP) 
<br>(11)&nbsp;การแลกเปลี่ยนข้อมูลด้านความมั่นคงทางไซเบอร์ (Cybersecurity) เช่น Cybersecurity information <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exchange (CYBEX) (ตาม Rec. ITU-T X.1500)
<br>(12)&nbsp;ชนิดไฟล์ข้อมูลต่าง ๆ

			</p>
				
			<p class="post-footer">		
			<a href="#" class="readmore">Read more</a> |
			<a href="#" class="comments">Comments (3)</a> |				
			<span class="date">July 20, 2008</span>
			
			</p>
			
			<h2><a href="index.html">คำนิยาม</a></h2>
			
			<h3>ศัพท์ทางเทคนิค</h3>
			<div>
                <table border="1" cellspacing="0">
                    <tr style="vertical-align:top">
                        <td width="30%">วัตถุ<br />(Object)</td>
                        <td>สิ่งที่เกี่ยวกับการสื่อสารโทรคมนาคมและการประมวลผลข้อมูลสารสนเทศ โดยสิ่งนั้นสามารถถูกระบุได้ด้วยชื่อและสามารถนำไปลงทะเบียนได้ [1] </td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>ตัวระบุวัตถุ<br /> (Object Identifier หรือ OID)</td>
                        <td>รายการลำดับของตัวเลขจำนวนเต็มซึ่งใช้ระบุวัตถุ หรืออาจจะเรียกว่าหมายเลขโอไอดี [1]</td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>ค่าจำนวนเต็มปฐมภูมิ<br />(Primary integer value)</td>
                        <td>เลขจำนวนเต็มที่ใช้เป็นค่าปฐมภูมิสำหรับใช้เป็นตัวระบุวัตถุ [1]</td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>ตัวระบุวัตถุแบบทุติยภูมิ<br />(Secondary identifier) </td>
                        <td>ตัวระบุวัตถุซึ่งเป็นค่าที่ประกอบด้วยตัวเลข ตัวอักษรภาษาอังกฤษ และเครื่องหมายยัติภังค์ (-) ซึ่งเป็นค่าที่มนุษย์อ่านเข้าใจ โดยตัวอักษรที่ใช้ขึ้นต้นต้องเป็นภาษาอังกฤษตัวพิมพ์เล็ก และต้องไม่ใช้เครื่องหมายยัติภังค์ลงท้ายและไม่ใช้เครื่องหมายยัติภังค์ติดกันสองตัว</td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>ป้ายชื่อยูนิโคดแบบจานวนเต็ม<br />(Integer-valued Unicode label)</td>
                        <td>ป้ายชื่อที่ใช้การเข้ารหัสอักขระแบบยูนิโคด (Unicode) ซึ่งเป็นจานวนเต็ม (จะไม่ใช้เลขศูนย์นาหน้ายกเว้นจะใช้เพียงแค่เลขศูนย์เพียงตัวเดียวเท่านั้น) สาหรับตัวระบุวัตถุซึ่งจะมีค่าเหมือนกับค่าจานวนเต็มปฐมภูมิ ทั้งนี้ป้ายชื่อแบบยูนิโคดต้องไม่ประกอบด้วยตัวอักขระว่าง (Space character) [1]</td>
                    </tr>
                    <tr style="vertical-align:top">
                        <td>ป้ายชื่อยูนิโคดแบบที่ไม่ใช่จานวนเต็ม<br />(Non-integer Unicode label)</td>
                        <td>ป้ายชื่อที่ใช้การเข้ารหัสอักขระแบบยูนิโคด (Unicode) ซึ่งสามารถใช้อักษรภาษาอังกฤษหรือภาษาไทยหรือภาษาอื่น ๆ รวมถึงตัวเลขและอักขระพิเศษอื่น ๆ โดยป้ายชื่อดังกล่าวสามารถนามาใช้ซ้าได้ ทั้งนี้ป้ายชื่อแบบยูนิโคดจะต้องไม่ประกอบด้วยตัวอักษรว่าง (Space character) [1]</td>
                    </tr>
                </table>				
			</div>
				

		<!-- main ends -->	
		</div>
				
    <uc1:Sidebar1 runat="server" id="Sidebar1" />


</asp:Content>
