<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/control/Admin.master"
    CodeBehind="Stations.aspx.vb" Inherits="AlternateAlerts_Web.Stations" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
    <link href="/Styles/Master.css" rel="stylesheet" type="text/css" />
    <link href="/styles/style.css" rel="stylesheet" type="text/css" />
    <br />
    <br />
    <asp:Accordion ID="accordionProfile" runat="server" Width="100%" ContentCssClass=""
        FramesPerSecond="30" HeaderCssClass="AccordionPanelTab" HeaderSelectedCssClass="AccordionPanelTabSelected">
        <Panes>
            <asp:AccordionPane ID="AccordionPane1" runat="server" ContentCssClass="" HeaderCssClass="">
                <Header>
                    My Stations</Header>
                <Content>
                    <div style="width: 100%; margin-left: auto; margin-right: auto; margin-top: 25px;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            CssClass="input12" DataKeyNames="stationID" DataSourceID="sqlGetContactStations"
                            ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="orgName" HeaderText="Agency" SortExpression="orgName" />
                                <asp:BoundField DataField="stationID" HeaderText="stationID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="stationID" Visible="False" />
                                <asp:BoundField DataField="stationName" HeaderText="Station" SortExpression="stationName" />
                                <asp:BoundField DataField="stationNumber" HeaderText="#" SortExpression="stationNumber" />
                                <asp:BoundField DataField="stationType" HeaderText="Type" SortExpression="stationType" />
                                <asp:BoundField DataField="stationCity" HeaderText="City" SortExpression="stationCity" />
                                <asp:BoundField DataField="stationState" HeaderText="State" SortExpression="stationState" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#a5a29f" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#a5a29f" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="sqlGetContactStations" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                            SelectCommand="GetContactStations" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="1" Name="contactID" SessionField="contactID"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </Content>
            </asp:AccordionPane>
        </Panes>
    </asp:Accordion>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
</asp:Content>
