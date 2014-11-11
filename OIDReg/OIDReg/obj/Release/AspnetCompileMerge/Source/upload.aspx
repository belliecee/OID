<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="OIDReg.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
        <input id="filMyFile" type="file" runat="server">
    </div>
        <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
        <div>
            <div>
                <ul>
                    <li><a href="Temp/imagesCA1YD0AS.jpg">imagesCA1YD0AS.jpg</a></li>
                    <li><a href="Temp/2009.pdf">2009.pdf</a></li>
                    <li><a href="Temp/OIDField_v02.xlsx">OIDField_v02.xlsx</a></li>
                    <li><a href="Temp/1234.doc">หนังสือแจ้งส่งมอบ.docx</a></li>
                    <li><a href="Temp/Outlook.zip">Outlook.com.zip</a></li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
    