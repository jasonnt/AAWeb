<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" Inherits="AlternateAlerts_Web.Login" title="Untitled Page" Codebehind="Login.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Login</h2>
    <p>
        <asp:Login ID="myLogin" runat="server" BackColor="#F7F7DE" 
            BorderColor="#CCCC99" BorderStyle="Solid"
            BorderWidth="1px" CreateUserText="Don't have an account? Create one!" CreateUserUrl="~/CreateAccount.aspx"
            Font-Names="Verdana" Font-Size="10pt">
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        </asp:Login>
        &nbsp;</p>
    <p>
        There are three accounts currently on the system, all with the same password: <span
            style="font-family: Courier New">pass@word</span></p>
    <ul>
        <li>Scott</li>
        <li>Jisun</li>
        <li>Sam</li>
    </ul>
</asp:Content>

