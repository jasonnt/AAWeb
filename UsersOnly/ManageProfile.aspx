<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeBehind="ManageProfile.aspx.vb" Inherits="AlternateAlerts_Web.ManageProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h2>Manage Your Profile</h2>
    <p class="noteBox">
        <asp:HyperLink ID="hlViewYourProfile" runat="server">View your profile as it appears to other users...</asp:HyperLink>
    </p>
    <p>
        <asp:DetailsView ID="dvYourProfile" runat="server" AutoGenerateRows="False" 
            DataKeyNames="UserId" DataSourceID="dsUserDetails" DefaultMode="Edit">
            <Fields>
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" 
                    SortExpression="UserName" />
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Columns="35" 
                            Text='<%# Eval("Email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server" 
                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="[Required]" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExpEmail" runat="server" 
                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="[Invalid]" 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Columns="80" 
                            Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Columns="80" 
                            Text='<%# Bind("LastName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtComments" runat="server" Columns="80" Rows="5" 
                            Text='<%# Bind("Comments") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" onclick="lbCancel_Click"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsUserDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT aspnet_Users.UserId, UserDetails.FirstName, UserDetails.LastName, UserDetails.Comments, aspnet_Users.UserName, aspnet_Membership.Email 
FROM aspnet_Users 
INNER JOIN aspnet_Membership 
	ON aspnet_Users.UserId = aspnet_Membership.UserId 
LEFT OUTER JOIN UserDetails 
	ON UserDetails.UserId = aspnet_Users.UserId 
WHERE (aspnet_Users.UserId = @UserId)" 
            UpdateCommand="AddOrUpdateUserDetails" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="UserId" Type="Object" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" />
                <asp:Parameter Name="FirstName" />
                <asp:Parameter Name="LastName" />
                <asp:Parameter Name="Comments" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>
