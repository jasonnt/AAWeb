<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" Inherits="AlternateAlerts_Web.CreateAccount" title="Untitled Page" Codebehind="CreateAccount.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Create a New Account</h2>
    <p>
        In order to visit the UsersOnly pages you must have an account and be logged in.
        Use this page to create a new user account.</p>
<p>
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" CancelDestinationPageUrl="~/Default.aspx"
        ContinueDestinationPageUrl="~/Default.aspx" DisplayCancelButton="True">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</p>
<p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ValidationGroup="CreateUserWizard1" />
</p>
            <p>
        &nbsp;</p>
</asp:Content>

