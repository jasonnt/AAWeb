<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AA_CSS.Master" CodeBehind="log.aspx.vb" Inherits="AlternateAlerts_Web.log" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
<style type="text/css">
    .input12
    {
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right_Content" runat="server">
    <div class="input12">Filter Station: 
        <asp:DropDownList ID="dlRescueStation" 
            runat="server" CssClass="input12" DataSourceID="sqlStations" 
            DataTextField="Station" DataValueField="stationID" AutoPostBack="True">
            <asp:ListItem Selected="True">Select a station...</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="sqlStations" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>" 
            SelectCommand="SELECT [stationName]+' ' + [stationType] as Station, [stationID] FROM [Station] ORDER BY 1 ">
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
                    <a data-href="miniplayer.aspx?recordingid=<%#Eval("recordingID")%>&station=<%#Server.UrlEncode(Eval("StationName"))%>&timestamp=<%#Server.UrlEncode(Eval("Recording"))%>"><i class="icon-volume-up"></i></a>
 <%--                 <a data-href="<%# string.Format("miniplayer.aspx?recordingid={0}", Eval("recordingID")) %>"><i class="icon-volume-up"></i></a>--%>  

               </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#817569" Font-Bold="True" Font-Size="14px" 
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
        SelectCommand="SELECT TOP 50 S.StationName + ' ' + S.StationType as StationName, cast(Convert(date,recordingTimestamp, 131) as varchar) +' @ '+ cast(REPLACE(REPLACE(RIGHT('0'+LTRIM(RIGHT(CONVERT(varchar,recordingTimestamp,100),7)),7),'AM',' AM'),'PM',' PM') as varchar) as Recording,  recordingID FROM dbo.Recording JOIN dbo.Station S ON S.stationID = dbo.Recording.stationID ORDER BY recordingTimestamp DESC">
    </asp:SqlDataSource>

     <div id="modal-player" class="modal hide">
                                    <script type="text/javascript">
                                        jQuery(function ($) {
//                                            $('#modal-player').css({
//                                                'width': function () {
//                                                    return ($(document).width() * .7) + 'px';
//                                                },
//                                                'margin-left': function () {
//                                                    return -($(this).width() / 2);
//                                                }
//                                            });
                                            // find all tr's with a data-href attribute
                                            $('td a[data-href]').click(function () {
                                                // copy the data-href value to the modal for later use
                                                $('#modal-player').attr('data-href', $(this).attr('data-href'));
                                                // show the modal window
                                                $('#modal-player').modal({ show: true, backdrop: true, keyboard: true });
                                            }).find('a').hover(function () {
                                                // unbind it in case I put some a tags in the table row eventually
                                                $(this).parents('td').unbind('click');
                                            }, function () {
                                                $(this).parents('td').click(function () {
                                                    // rebind it
                                                    $('#modal-player').attr('data-href', $(this).attr('data-href'));
                                                    $('#modal-player').modal({ show: true, backdrop: true, keyboard: true });
                                                });
                                            });

                                            // when the modal show event fires, load the url that was copied to the data-href attribute
                                            $('#modal-player').bind('show', function () {
                                                $(this).load($(this).attr('data-href'));
                                            });
                                        });

                                        
</script>
                                    </div>
</asp:Content>
