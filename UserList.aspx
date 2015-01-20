<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" Inherits="AlternateAlerts_Web.UserList" title="Untitled Page" Codebehind="UserList.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        User List</h2>
    <p>
        Here is a list of the user accounts in the system. This list is retrieved programmatically
        using the Membership class's GetAllUsers() method.</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Font-Names="Verdana" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="allUsersDataSource" EmptyDataText="There are no users in the system..." Font-Italic="False">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Email", "mailto:{0}") %>'
                            Text='<%# Eval("Email") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CreationDate" HeaderText="Created On" ReadOnly="True"
                    SortExpression="CreationDate" />
                <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" SortExpression="LastLoginDate" />
            </Columns>
            <EmptyDataRowStyle Font-Italic="True" />
        </asp:GridView>
        <asp:ObjectDataSource ID="allUsersDataSource" runat="server" SelectMethod="GetAllUsers" TypeName="System.Web.Security.Membership"></asp:ObjectDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

