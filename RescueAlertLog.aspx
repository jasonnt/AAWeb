<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RescueAlertLog.aspx.vb" Inherits="AlternateAlerts_Web.RescueAlertLog" %>
<%@ Register assembly="ASPNetAudio.NET3" namespace="ASPNetAudio" tagprefix="ASPNetAudio" %>
<%@ Register assembly="ASPNetMediaGUI.NET3" namespace="ASPNetMediaGUI" tagprefix="ASPNetMediaGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">

    function PopupCenter(pageURL, title, w, h) {
        var left = (screen.width / 2) - (w / 2);
        var top = (screen.height / 2) - (h / 2);
        var targetWin = window.open(pageURL, "'" & title & "'", 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
    } 
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="input12">Filter Station: 
        <asp:DropDownList ID="dlRescueStation" 
            runat="server" CssClass="input12" DataSourceID="sqlStations" 
            DataTextField="Station" DataValueField="stationID" AutoPostBack="True">
            <asp:ListItem Selected="True">Select a station...</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="sqlStations" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" 
            SelectCommand="SELECT [stationName]+' ' + [stationType] as Station, [stationID] FROM [Station] ORDER BY 1">
        </asp:SqlDataSource>
    </div>
    <br />
    <asp:GridView ID="gvRescueLog" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" CssClass="ProfileMainTable" DataKeyNames="recordingID" 
        DataSourceID="sqlRescueLog" ForeColor="#333333" GridLines="None" 
        Width="609px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Recording" HeaderText="Recording Date" 
                ReadOnly="True" SortExpression="Recording" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="StationName" HeaderText="Station Name" 
                ReadOnly="True" SortExpression="StationName" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="recordingID" HeaderText="recordingID" 
                InsertVisible="False" ReadOnly="True" SortExpression="recordingID" 
                Visible="False" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btnPlay" runat="server" ImageUrl="~/images/play.gif" OnClientClick=<%# string.Format("PopupCenter('miniplayer.aspx?recordingid={0}','Alert Player', 300, 60);", Eval("recordingID")) %> />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" Font-Size="14px" 
            ForeColor="White" HorizontalAlign="Left" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" Font-Size="12px" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqlRescueLog" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" 
        SelectCommand="SELECT S.StationName + ' ' + S.StationType as StationName, cast(Convert(date,recordingTimestamp, 131) as varchar) +' @ '+ cast(REPLACE(REPLACE(RIGHT('0'+LTRIM(RIGHT(CONVERT(varchar,recordingTimestamp,100),7)),7),'AM',' AM'),'PM',' PM') as varchar) as Recording,  recordingID FROM dbo.Recording JOIN dbo.Station S ON S.stationID = dbo.Recording.stationID ORDER BY recordingTimestamp DESC">
    </asp:SqlDataSource>
</asp:Content>
