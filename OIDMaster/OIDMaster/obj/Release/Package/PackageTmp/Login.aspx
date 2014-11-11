
<%@ Page Language="C#" AutoEventWireup="true" Inherits="OIDMaster.Login" Codebehind="Login.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OID Manager</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
    <div id="topPan">
	    <!-- <a href="index.html"><img src="images/logo.gif" alt="Genious Web" width="208" height="58" border="0" title="Genious Web" /></a> -->
        <div style="color:#ffffff; font-weight:700; font-size:xx-large;">
            <br />
            Object Identifier (OID) Administrator
        </div>
    </div>
    <div id="bodytopmainPan">
    <div id="bodytopPan">	
        <div>
            <br />
                    <div>	
			            <div style="margin-left:10px;">
                            <h2>Login</h2>
                            <div>User name</div>
                            <div><asp:TextBox ID="t1" runat="server" Width="300px" MaxLength="250" style="height:22px;border:1px solid #666" ></asp:TextBox></div>
                            <div style="margin-top:10px;">password</div>
                            <div><asp:TextBox ID="t2" runat="server" Width="300px" MaxLength="250" style="height:22px;border:1px solid #666"  TextMode="Password"></asp:TextBox></div>
                                                
                            <div style="margin:20px 0px;">
                                <asp:Button ID="Button1" runat="server" Text="Submit" Width="78px" CssClass="button" OnClick="btnSubmit_Click"   /> 
                            </div>

                            <div>
                                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                            </div>
			            </div>
                    </div>	
            <br /><br /><br />
        </div>


    </div>

    </div>

    <div id="bodymainmiddlePan">
      <div id="bodymiddlePan">
            <br /><br /><br /><br /><br />
          <br /><br />
      </div>
    </div>


    <div id="footermainPan">
        <div id="footerPan">
	            <a href="#"><img src="images/logo_etda_new.png"  width="186" height="50" border="0" class="footerlogo" /></a> 
		            <ul>          
 	                    <li style="color: #ffffff">สำนักงานพัฒนาธุรกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน)<br />
                            เป็นองค์กรของรัฐที่จัดตั้งขึ้นเพื่อส่งเสริมและพัฒนาธุรกรรมทางอิเล็กทรอนิกส์ในประเทศไทย<br />
                            ไม่ได้มีวัตถุประสงค์เพื่อแสวงหากำไร หากท่านพบว่ามีข้อมูลใดๆ ที่ละเมิดทรัพย์สินทางปัญญาปรากฏอยู่ใน<br />
                            เว็บไซต์ของสำนักงาน โปรดแจ้งให้ทราบเพื่อดำเนินการแก้ปัญหาโดยเร็วที่สุดต่อไป</li>
 	             </ul>
  	            <p>
                      <br>
  	            </p>
	            </div>
	    </div>
</form>
    
    <div>

    </div>
</body>
</html>
