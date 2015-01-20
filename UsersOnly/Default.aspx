<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" Inherits="AlternateAlerts_Web.UsersOnly_Default" title="Untitled Page" Codebehind="Default.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Authenticated Users Only!</h2>
<p>Only authenticated users can visit this page. You are logged on as 
    <asp:LoginName ID="LoginName1" runat="server" />. How's it going, 
    <asp:LoginName ID="LoginName2" runat="server" />?
</p>
</asp:Content>

