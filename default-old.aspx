<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default-old.aspx.vb" Inherits="AlternateAlerts_Web._default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Alternate Alerts</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style2
        {
            font-size: medium;
        }
    </style>
</head>
<body>
    <div class="container">
        <form name="frmAuthentication" id="frmAuthentication" runat="server">
        <div id="maintenance">
            <asp:Table ID="tblLogin" Width="100%" border="0" CellSpacing="0" CellPadding="1"
                class="login_table_td" runat="server">
                <asp:TableRow runat="server">
                    <asp:TableCell Width="34%" runat="server">Username:</asp:TableCell>
                    <asp:TableCell runat="server" Width="54%">
                        <asp:TextBox ID="tbUsername" runat="server" class="input12"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Width="12%">&nbsp;</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Password:</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="tbPassword" TextMode="Password" runat="server" class="input12"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:ImageButton ID="btnLogin" type="image" src="images/images.jpg" runat="server" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" ColumnSpan="3">Forget your username/password?</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" ColumnSpan="3">Register for an account</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Label ID="lblWelcome" CssClass="login_welcome" Visible="false" runat="server" />
            <asp:Panel ID="pnlMaintenance" runat="server" Visible="False">
                <br />
                <div>
                    <asp:HyperLink ID="linkUserProfile" runat="server" visible="false" NavigateUrl="/control/profile.aspx">User Profile</asp:HyperLink>
                </div>
                <br />
                <br />
                <br />
               
            </asp:Panel>
        </div>
        <div class="header">
            <img src="images/AA_Logo.jpg" />
        </div>
        <div class="header">
            <table width="986" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="left_nav" id="left_nav">
                    </td>
                    <td class="center_nav">
                        <asp:HyperLink ID="linkHome" NavigateUrl="/default.aspx" runat="server" CssClass="homeLinks">Home</asp:HyperLink>
                    </td>
                    <td class="center_nav">
                        Services
                    </td>
                    <td class="center_nav">
                        <asp:HyperLink ID="hlAlertLog" runat="server" NavigateUrl="/RescueAlertLog.aspx"
                            CssClass="homeLinks" EnableTheming="True">Alert Log</asp:HyperLink>
                    </td>
                    <td class="center_nav">
                        Contact Us
                    </td>
                    <td class="right_nav">
                    </td>
                </tr>
            </table>
            <br>
        </div>
        </form>
        <div class="header">
            <table width="996" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <img src="images/Fire%20Splash.jpg" width="244" height="357">
                    </td>
                    <td>
                        <img src="images/Rescue%20Splash.jpg" width="235" height="357">
                    </td>
                    <td>
                        <img src="images/EMS%20Splash.jpg" width="238" height="357">
                    </td>
                    <td>
                        <img src="images/Police%20Splash.jpg" width="237" height="357">
                    </td>
                </tr>
            </table>
        </div>
        <article class="content">
    <section>
      <h2 class="style1">&nbsp;</h2>
        <p class="style1">
            <span class="style2">Alternate Alerts</span> is a mass messaging system that 
            delivers messages to a list of members quickly and reliably through Email, SMS 
            or Voice. This allows an organization to have dispatches/alerts delivered to 
            your Cell, Home or Work phone. You can also have it delivered to an email 
            address.</p>
        <p class="style1">
            <span class="style2">Alternate Alerts</span> is the perfect companion to the 
            Emergency departments paging/dispatch system. With Alternate Alerts you can rest 
            assured that no matter where you are, or whether you forgot your pager at home, 
            or if your pager battery runs dead you will get your calls.
        </p>
        <p class="style1">
            <span class="style2">Alternate Alerts </span>can be customized to meet any 
            department’s needs. Alternate Alerts can be setup as a standalone system for a 
            single department, or we can work with a dispatch center to cover entire 
            counties. Alternate Alerts is completely autonomous and requires no additional 
            steps from dispatchers. It records, uploads and distributes the dispatch to the 
            members quickly and reliably. Each member can login to their profile online and 
            customize their options that include delivery methods, blackout periods, email 
            address and more.</p>
      <p>&nbsp;</p>
    </section>
  </article>
    </div>
</body>
</html>
