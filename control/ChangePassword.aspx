<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/control/Admin.master" CodeBehind="ChangePassword.aspx.vb" Inherits="AlternateAlerts_Web.ChangePassword1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/styles/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .Right
        {
            text-align: right;
        }
        .Center
        {
            text-align: center;
        }
    </style>
</asp:Content>
   
<asp:Content ID="Content2" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
    <div class="input12">
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="tbPassword" ControlToValidate="tbPassword2" 
        ErrorMessage="Passwords must match, correct and try again." CssClass="ValidationError"></asp:CompareValidator>
    </div>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <br />
    
        <table class="input12" align="center">
        <tr>
            <td class="Right">Current Password:
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="tbCurrentPW" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="rfvCurrentPw" runat="server" 
        ControlToValidate="tbCurrentPW" ErrorMessage="Current Password is required." CssClass="ValidationError"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="Right">New Password:
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="tbPassword" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
        ControlToValidate="tbPassword" ErrorMessage="Password is required." CssClass="ValidationError"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="Right">Confirm Password:
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
               <asp:TextBox ID="tbPassword2" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="rfvPassword2" runat="server" 
        ControlToValidate="tbPassword2" ErrorMessage="Confirm Password is required." CssClass="ValidationError"></asp:RequiredFieldValidator>
</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td><br /><asp:Button ID="btnChangePW" runat="server" Text="Change Password" CssClass="input12" /></td>
        </tr>
    </table>
    <br />
    
    <br />
    <br />

</asp:Content>
