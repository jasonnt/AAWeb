<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="lastSMS.aspx.vb" Inherits="AlternateAlerts_Web.lastSMS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 75%;
            margin-left: auto;
            margin-right:auto;
        }
        .auto-style2 {
            height: 23px;
            vertical-align: top;
        }
        .auto-style3 {
            width: 183px;
            height: 80px;
        }
        .auto-style4 {
            height: 23px;
            width: 214px;
            vertical-align: top;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <img class="auto-style3" src="images/gps.jpg" /></td>
                <td class="auto-style2">
                    
                    <asp:Label ID="lblMessage" runat="server" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
