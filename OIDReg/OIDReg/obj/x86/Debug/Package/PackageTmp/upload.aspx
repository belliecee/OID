<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="OIDReg.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #filMyFile {
            width: 540px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div >
        <input id="filMyFile" type="file" runat="server">
    </div>
        <div style="font-family:Verdana; font-size:10pt;">
            <div style="margin-top:10px; margin-bottom:10px;">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <div style="visibility:hidden">
                    <ul>
                        <li><a href="Temp/imagesCA1YD0AS.jpg">imagesCA1YD0AS.jpg</a></li>
                        <li><a href="Temp/2009.pdf">2009.pdf</a></li>
                        <li><a href="Temp/OIDField_v02.xlsx">OIDField_v02.xlsx</a></li>
                        <li><a href="Temp/1234.doc">หนังสือแจ้งส่งมอบ.docx</a></li>
                        <li><a href="Temp/Outlook.zip">Outlook.com.zip</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
    