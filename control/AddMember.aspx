<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/control/Admin.master"
    CodeBehind="AddMember.aspx.vb" Inherits="AlternateAlerts_Web.AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
    <p style="text-align: left">
        <br />
        To add a new member, first enter his/her phone number in the field.&nbsp; Click
        next.&nbsp; If the user currently exists, you will have the option to link him/her
        to your organization allowing them to receive alerts from your systems.&nbsp; If
        the user does not exist, you will be prompted to input the user information.</p>
    <asp:Panel ID="panelCell" runat="server" Enabled="True">
        <p style="text-align: left">
            &nbsp;Contact Cell Number:&nbsp;
            <asp:TextBox ID="tbContactPhone" runat="server" CssClass="input12"></asp:TextBox>
            &nbsp;<asp:Button ID="btnCheckContact" runat="server" CssClass="input12" Text="Next" />
        </p>
    </asp:Panel>
    <asp:Panel ID="panelNewMember" runat="server" Enabled="False" Visible="false">
        <div id="ProfileContainer">
            <table id="ProfileMainTable">
                <tr>
                    <td class="ProfileTable" width="100">
                        Organization
                    </td>
                    <td colspan="3" class="ProfileTable">
                        <asp:DropDownList ID="ddlOrganizations" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="ProfileTable" width="100">
                        First Name
                    </td>
                    <td class="ProfileTable" width="200">
                        <asp:TextBox ID="contactFirstName" CssClass="input12" runat="server" />
                    </td>
                    <td class="ProfileTable" width="100">
                        Last Name
                    </td>
                    <td class="ProfileTable" width="200">
                        <asp:TextBox ID="contactLastName" CssClass="input12" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="ProfileTable" width="100">
                        E-mail Address
                    </td>
                    <td colspan="3" width="500" class="ProfileTable">
                        <asp:TextBox ID="contactEmail" CssClass="input12" Width="300" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="ProfileTable" width="100">
                        Cell Number
                    </td>
                    <td class="ProfileTable" width="200">
                        <asp:TextBox ID="contactCellNumber" CssClass="input12" runat="server" />
                    </td>
                    <td class="ProfileTable" width="100">
                        Cell Carrier
                    </td>
                    <td class="ProfileTable" width="200">
                        <asp:DropDownList ID="contactCarrierID" runat="server" DataValueField="carrierID"
                            DataSourceID="sqlCarriers" DataTextField="carrierName">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqlCarriers" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                            SelectCommand="SELECT [carrierID] as carrierID, [carrierName] FROM [Carrier] ORDER BY [carrierName]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="ProfileTable" width="100">
                        Password
                    </td>
                    <td class="ProfileTable" width="200" colspan="3">
                        <asp:TextBox ID="contactPassword" CssClass="input12" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" width="600" class="ProfileTable">
                        <asp:Button ID="InsertButton" runat="server" Text="Save User" CssClass="input12"
                            CommandName="Insert" OnClick="InsertButton_Click" PostBackUrl="~/control/AddMember.aspx"
                            ViewStateMode="Enabled" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <div class="modal hide" id="modalLink">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                ×</button>
            <h3>
                Link Member</h3>
        </div>
        <div class="modal-body">
            <p>The member phone you entered currently exists. </p>
            <p>Would you like to link this member to one of your organization?</p>
            <p><asp:DropDownList ID="ddlOrganizations2" runat="server">
                        </asp:DropDownList></p>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a> <asp:Button ID="btnLink" runat="server" Text="Link Member" CssClass="btn btn-primary" ViewStateMode="Enabled" PostBackUrl="/control/AddMember.aspx" />
        </div>
    </div>
    <script type="text/javascript">
        function ShowLinkModal($) {
            $('#modalLink').modal('show')
        };
    </script>
</asp:Content>
