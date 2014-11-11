<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="OIDReg.Search" %>

<%@ Register Src="~/Sidebar1.ascx" TagPrefix="uc1" TagName="Sidebar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <div style="padding:4px 15px; font-weight:bold; font-size:12pt;margin-bottom:15px;">Basic Search</div>
        <div style="text-align:left;padding:0px 15px; font-family:'Segoe UI';font-size:10pt;">
            <div >
                  <p>
                        This form allows for a quick search in the OID repository. However, please note that this basic search is approximative and does not necessarily display all expected results. For a more detailed (but more time-consuming) search, consider doing an advanced search.
                    </p>
                <p>
                    Fields "Description", "Information", "Current Registration Authority" and "First Registration Authority" as well as the list of identifiers associated with each OID are searched. 
                    Text that appears as parameters of HTML tags (such as a URL given as the href parameter of an &lt;a&gt; tag) are ignored. Full email adresses can be searched, but not a part of them. The advanced search is also the only way to search for Unicode labels.
                </p>
            </div>
            <div style="margin-top:40px;margin-left:10px;">
                Search For &nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="250px" CssClass="inputtext"></asp:TextBox>&nbsp;
                <asp:Button ID="Button1" runat="server" Text="SUBMIT" Width="100px" CssClass="button"  OnClick="Button1_Click" />                
            </div>
            <div>

            </div>
        </div>	
     </div>	

    <uc1:Sidebar1 runat="server" ID="Sidebar1" />
</asp:Content>
