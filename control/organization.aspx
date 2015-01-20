<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/control/Admin.master" CodeBehind="organization.aspx.vb" Inherits="AlternateAlerts_Web.organization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
    <br />
<asp:FormView ID="fvNewOrg" runat="server" DataSourceID="sqlMyOrganizations" 
        DefaultMode="Insert">
        <EditItemTemplate>
            orgID:
            <asp:Label ID="orgIDLabel1" runat="server" Text='<%# Eval("orgID") %>' />
            <br />
            orgName:
            <asp:TextBox ID="orgNameTextBox" runat="server" Text='<%# Bind("orgName") %>' />
            <br />
            orgContactID:
            <asp:TextBox ID="orgContactIDTextBox" runat="server" 
                Text='<%# Bind("orgContactID") %>' />
            <br />
            orgContactPhone:
            <asp:TextBox ID="orgContactPhoneTextBox" runat="server" 
                Text='<%# Bind("orgContactPhone") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table class="input12" style="width: 100%">
                <tr>
                    <td style="width: 174px">
                        Organization Name:</td>
                    <td>
                        <asp:TextBox ID="tborgName" runat="server" Width="266px" />
                        <asp:RequiredFieldValidator ID="fvOrgName" runat="server" 
                            ControlToValidate="tborgName" ErrorMessage="Organization Name Required" 
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 174px">
                        Organization Contact:</td>
                    <td>
                        <asp:DropDownList ID="ddlorgContactID" runat="server" DataSourceID="sqlContacts" 
                            DataTextField="contactName" DataValueField="contactID" >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqlContacts" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" 
                            SelectCommand="SELECT [contactID], [contactName] FROM [V_GetOrgContacts] ORDER BY [contactName]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="width: 174px">
                        Contact Phone Number:</td>
                    <td>
                        <asp:TextBox ID="tborgContactPhone" runat="server" Width="186px" />
                        <asp:RequiredFieldValidator ID="rfvOrgPhone" runat="server" 
                            ControlToValidate="tborgContactPhone" 
                            ErrorMessage="Contact Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 174px">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnAddOrg" runat="server" 
                            CssClass="input12" Text="Add New Organization" onclick="btnAddOrg_Click" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            Organization Name:
            <asp:Label ID="orgNameLabel" runat="server" Text='<%# Bind("orgName") %>' />
            <br />
            Contact Name:
            <asp:Label ID="orgContactIDLabel" runat="server" 
                Text='<%# Bind("ContactName") %>' />
            <br />
            Contact Phone Number:
            <asp:Label ID="orgContactPhoneLabel" runat="server" 
                Text='<%# Bind("orgContactPhone") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlMyOrganizations" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" 
        SelectCommand="GetMyOrganizations" SelectCommandType="StoredProcedure" 
        InsertCommand="AddOrganization" InsertCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="contactID" 
                SessionField="contactID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="fvNewOrg$tborgName" Name="orgName" PropertyName="Text" />
            <asp:ControlParameter ControlID="fvNewOrg$ddlorgContactID" Name="orgContactID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="fvNewORg$tborgContactPhone" Name="orgContactPhone" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="gvOrganizations" runat="server" AutoGenerateColumns="False" 
        DataSourceID="GetOrganizations" CellPadding="4" CssClass="input12" 
        ForeColor="#333333" GridLines="None" Width="843px" DataKeyNames="orgID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="orgID" HeaderText="orgID" InsertVisible="False" 
                ReadOnly="True" SortExpression="orgID" Visible="False" />
            <asp:TemplateField HeaderText="Organization Name" SortExpression="orgName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orgName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orgName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact" SortExpression="ContactName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="sqlGetOrgContacts" DataTextField="contactName" 
                        DataValueField="contactID" SelectedValue='<%# Bind("orgContactID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqlGetOrgContacts" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" 
                        SelectCommand="SELECT [contactName], [contactID] FROM [V_GetOrgContacts] ORDER BY [contactName]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone Number" SortExpression="orgContactPhone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("orgContactPhone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("orgContactPhone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="GetOrganizations" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" 
        SelectCommand="GetOrganizations" SelectCommandType="StoredProcedure"
        DeleteCommand="DelOrganization" DeleteCommandType="StoredProcedure" >
        <DeleteParameters>
            <asp:Parameter  Name="orgID" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
