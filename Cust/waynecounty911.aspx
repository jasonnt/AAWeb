<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="waynecounty911.aspx.vb" Inherits="AlternateAlerts_Web.waynecounty911" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 80%; margin-right: auto; margin-left: auto">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDrivingDirections" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="smsDatetime" HeaderText="Timestamp" SortExpression="smsDatetime">
                <HeaderStyle Font-Bold="True" Font-Size="Medium" Width="150px" />
                <ItemStyle Font-Size="Small" VerticalAlign="Top" />
                </asp:BoundField>
                <asp:BoundField DataField="Column1" HeaderText="Station Name" ReadOnly="True" SortExpression="Column1">
                <HeaderStyle Font-Bold="True" Font-Size="Medium" Width="200px" />
                <ItemStyle Font-Size="Small" VerticalAlign="Top" />
                </asp:BoundField>
                <asp:BoundField DataField="Message" HeaderText="Dispatch Message" SortExpression="Message">
                <HeaderStyle Font-Bold="True" Font-Size="Medium" />
                <ItemStyle Font-Size="Small" VerticalAlign="Top" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsDrivingDirections" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" SelectCommand="GetAllSMSforOrg" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="30" Name="orgID" Type="Int32" />
                <asp:Parameter DefaultValue="-4" Name="timeoffset" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
