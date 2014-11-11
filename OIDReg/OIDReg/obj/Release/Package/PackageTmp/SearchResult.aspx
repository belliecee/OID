<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="OIDReg.SearchResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:10px 40px;border:0px solid black">
        <div style="margin:10px 15px;">
            <div style="font-weight:bold;font-size:13pt;">Search Result</div> 
            <div >
                <asp:Label ID="lblLabel" runat="server" Text="Label"></asp:Label>
            </div>
            <div style="margin-top:20px;">
                <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_ItemDataBound" >
                    <ItemTemplate>
                        <div id="Div1" runat="server" style="padding-bottom:10px;">
                            <span style="padding-right:5px;">1.</span>
                            <a href='oid.aspx?id=<%#Eval("node_id")%>' style="font-size:10pt;"><%#Eval("notation2")%>.<%#Eval("primary_int") %></a><br /><%#Eval("notation1")%>(<%#Eval("secondary_id") %>(<%#Eval("primary_int") %>)<br />
                            <asp:Label ID="lbl1" runat="server"></asp:Label>
                            <div>
                                <b>Description</b>: <%#Eval("description")%>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceHolder" runat="server"   >

                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>

