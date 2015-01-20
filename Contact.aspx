<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AA_CSS.Master" CodeBehind="Contact.aspx.vb" Inherits="AlternateAlerts_Web.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
        .style2
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right_Content" runat="server">
<p style="text-align: left; font-size:20px; font-family: Arial, Helvetica, sans-serif; padding-left: 20px;">Contact Alternate Alerts</p>
    <p style="text-align: center; font-size:20px; font-family: Arial, Helvetica, sans-serif; color:#c5132f;">
        ----------------------------------------------------------------------------------------------------</p>
    <p style="font-size: 16px; font-family: Arial, Helvetica, sans-serif; color:#c5132f; padding-left: 20px; color: #000000;">
    
        Mailing Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alternate Alerts<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        PO Box 41<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        Lawrence, MI&nbsp; 49064<br />
        <br />
        Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        (888) 532-5507<br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        For afterhours support, please leave a message. A support agent will contact<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        you shortly.<br />
        <br />
        Would you like more information? Complete this form and an agent will contact 
        you.<br />
        <br />
        <table align="center" class="style1" cellpadding="10">
            <tr>
                <td class="style2">
                    Name:</td>
                <td>
                    <asp:TextBox ID="tbName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Agency:</td>
                <td>
                    <asp:TextBox ID="tbAgency" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Phone:</td>
                <td>
                    <asp:TextBox ID="tbPhone" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    E-mail:</td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Best time to contact:</td>
                <td>
                    <asp:TextBox ID="tbBestTime" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Button ID="btnContact" runat="server" Text="Send" />
                </td>
            </tr>
        </table>
        <br />
        <br />
&nbsp;
    
    </p>

</asp:Content>
