<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" Inherits="AlternateAlerts_Web.UserDetails" Codebehind="UserDetails.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        All About
        <asp:Label ID="lblUserName" runat="server" Text="<%$ RouteValue:username %>"></asp:Label>...
    </h2>
        <asp:DetailsView ID="dvYourProfile" runat="server" AutoGenerateRows="False" 
            DataKeyNames="UserId" DataSourceID="dsUserDetails" 
        EmptyDataText="No user with this username was found...">
            <Fields>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkEmail" runat="server" Text='<%# Eval("Email") %>' NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bio" SortExpression="Bio">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Bio").ToString().Replace(Environment.NewLine, "<br />") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Age" SortExpression="BirthDate">
                    <ItemTemplate>
                        <%# DisplayAge(Eval("BirthDate")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Website" SortExpression="WebsiteUrl">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkWebsiteUrl" runat="server" Text='<%# Eval("WebsiteUrl") %>' NavigateUrl='<%# Eval("WebsiteUrl") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsUserDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT aspnet_Users.UserId, UserDetails.Bio, UserDetails.BirthDate, UserDetails.WebsiteUrl, aspnet_Users.UserName, aspnet_Membership.Email FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId LEFT OUTER JOIN UserDetails ON UserDetails.UserId = aspnet_Users.UserId WHERE (aspnet_Users.UserName = @UserName)">
            <SelectParameters>
                <asp:RouteParameter DefaultValue="" Name="UserName" RouteKey="username" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Content>

