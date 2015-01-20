<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/control/Admin.master"
    CodeBehind="login.aspx.vb" Inherits="AlternateAlerts_Web.login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/Master.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
    <form class="form-horizontal">
    <asp:Table ID="tblLogin" border="0" CellSpacing="0" CellPadding="1"
        class="login_table_td" runat="server">
        <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell ID="TableCell1" runat="server">Username:</asp:TableCell>
            <asp:TableCell ID="TableCell2" runat="server">
                <asp:TextBox ID="tbUsername" runat="server" class="input12"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell ID="TableCell3" runat="server" >&nbsp;</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell ID="TableCell4" runat="server">Password:</asp:TableCell>
            <asp:TableCell ID="TableCell5" runat="server">
                <asp:TextBox ID="tbPassword" TextMode="Password" runat="server" class="input12"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell ID="TableCell6" runat="server">
                &nbsp;&nbsp;<asp:ImageButton ID="btnLogin" type="image" src="/images/images.jpg" runat="server" Width="20" Height="20" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell ID="TableCell7" runat="server" ColumnSpan="3">Forget your username/password?</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </form>
</asp:Content>
