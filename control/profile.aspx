<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Admin.Master"
    CodeBehind="profile.aspx.vb" Inherits="AlternateAlerts_Web.profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Styles/Master.css" rel="stylesheet" type="text/css" />
    <link href="/styles/style.css" rel="stylesheet" type="text/css" />
    <script type="javascript">
        function ChangeIndex(controlID) {

            var accHost = $find(controlID);
            var i = accHost.get_SelectedIndex() + 1;
            accHost.set_SelectedIndex(i);
        }  
    </script>
    <script language="javascript" type="text/javascript">
        function OpenTable(trRow, imgId) {
            object = document.getElementById(trRow);
            if (object.style.display == "none") {
                object.style.display = "";
                document.getElementById(imgId).src = "/images/Expand.gif";
            }
            else {
                object.style.display = "none";
                document.getElementById(imgId).src = "/images/Collapse.gif";
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
  

    <br /><br />
    <div>
        <asp:Accordion ID="accordionProfile" runat="server" Width="100%" ContentCssClass=""
            FramesPerSecond="30" HeaderCssClass="AccordionPanelTab" HeaderSelectedCssClass="AccordionPanelTabSelected"
            Height="340px" TransitionDuration="250" AutoSize="None">
            <Panes>
                <asp:AccordionPane ID="AccordionPane1" runat="server" ContentCssClass="" HeaderCssClass=""
                    Height="340px">
                    <Header>
                        Personal Information</Header>
                    <Content>
                        <div class="ProfileContainer_Text">
                            Please make sure your personal information below is correct. The email address and
                            phone information here is used for sending alerts. Note: your cell phone number
                            is also your username. If you change it here, you are also changing your username.
                            Once all setting are correct, click "Save & Continue" button.<br />
                        </div>
                        <asp:FormView ID="FormViewPersonalInfo" runat="server" DataSourceID="sqlProfilePersonal"
                            DefaultMode="Edit" Width="100%">
                            <EditItemTemplate>
                                <div>
                                    <table id="ProfileMainTable" width="100%">
                                        <tr>
                                            <td>
                                                First Name
                                            </td>
                                            <td>
                                                <asp:TextBox ID="contactFirstName" CssClass="input12" runat="server" Text='<%# Bind("contactFirstName") %>' />
                                            </td>
                                            <td>
                                                Last Name
                                            </td>
                                            <td>
                                                <asp:TextBox ID="contactLastName" CssClass="input12" runat="server" Text='<%# Bind("contactLastName") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                E-mail Address
                                            </td>
                                            <td colspan="3">
                                                <asp:TextBox ID="contactEmail" CssClass="input12" Width="300" runat="server" Text='<%# Bind("contactEmail") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Cell Number
                                            </td>
                                            <td>
                                                <asp:TextBox ID="contactCellNumber" CssClass="input12" runat="server" Text='<%# Bind("contactCellNumber") %>' />
                                            </td>
                                            <td>
                                                Cell Carrier
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="contactCarrierID" runat="server" DataValueField="carrierID"
                                                    DataSourceID="sqlCarriers" SelectedValue='<%# Bind("contactCarrierID") %>' DataTextField="carrierName">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlCarriers" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                                                    SelectCommand="SELECT [carrierID] as carrierID, [carrierName] FROM [Carrier] ORDER BY [carrierName]">
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Button ID="UpdateButton" runat="server" Text="Save & Continue" CssClass="input12"
                                                    CommandName="Update" />
                                                &nbsp;&nbsp
                                                <asp:HyperLink ID="lnkChangePW" runat="server" CssClass="input12" NavigateUrl="~/control/ChangePassword.aspx">Change Password</asp:HyperLink>
                                                <br />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                contactFirstName:
                                <asp:Label ID="contactFirstNameLabel" runat="server" Text='<%# Bind("contactFirstName") %>' />
                                <br />
                                contactLastName:
                                <asp:Label ID="contactLastNameLabel" runat="server" Text='<%# Bind("contactLastName") %>' />
                                <br />
                                contactCarrierID:
                                <asp:Label ID="contactCarrierIDLabel" runat="server" Text='<%# Bind("contactCarrierID") %>' />
                                <br />
                                contactEmail:
                                <asp:Label ID="contactEmailLabel" runat="server" Text='<%# Bind("contactEmail") %>' />
                                <br />
                                contactCellNumber:
                                <asp:Label ID="contactCellNumberLabel" runat="server" Text='<%# Bind("contactCellNumber") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="sqlProfilePersonal" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                            SelectCommand="GetUserProfile" SelectCommandType="StoredProcedure" UpdateCommand="UpdateUserProfile"
                            UpdateCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="1" Name="aContactID" SessionField="contactID"
                                    Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="aContactID" SessionField="contactID" Type="Int32" />
                                <asp:Parameter Name="contactFirstName" />
                                <asp:Parameter Name="contactLastName" />
                                <asp:Parameter Name="contactEmail" />
                                <asp:Parameter Name="contactCellNumber" />
                                <asp:Parameter Name="contactcarrierID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="AccordionPane2" runat="server" ContentCssClass="" HeaderCssClass=""
                    Height="340px">
                    <Header>
                        Station Monitoring</Header>
                    <Content>
                        <div class="ProfileContainer_Text">
                            This is a list of all stations that your manager(s) have assigned to you. Please
                            select the stations in which you would like to setup/receive alerts from. Once all
                            setting are correct, click "Save & Continue" button.
                        </div>
                        <div>
                            <asp:CheckBoxList ID="chklistStations" runat="server" DataSourceID="sqlAvailableStations"
                                DataTextField="StationName" DataValueField="stationID" CssClass="checkbox inline">
                            </asp:CheckBoxList>
                        </div>
                        <div>
                            <br />
                            <asp:Button runat="server" ID="btnUpdateStations" Text="Save & Continue" CssClass="input12"
                                UseSubmitBehavior="False" />
                            <br />
                            <br />
                            <asp:SqlDataSource ID="sqlAvailableStations" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                                SelectCommand="GetUserAvailableStations" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="contactID" SessionField="contactID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="AccordionPane3" runat="server" ContentCssClass="" HeaderCssClass=""
                    Height="340px">
                    <Header>
                        Alert Notification Settings</Header>
                    <Content>
                        <div class="ProfileContainer_Text">
                            This is a list of the stations you have selected to receive alerts from. For each
                            station, please select the methods that you would like to receive the alerts on,
                            then click "update" to save the settings.
                        </div>
                        <asp:GridView ID="gvAlertsSettings" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvAlertSettings_RowDataBound"
                            CellPadding="4" ForeColor="#333333" BorderStyle="None" GridLines="None">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="img1" ImageUrl="/images/expand.gif" />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="stationID" ItemStyle-CssClass="hidden" ShowHeader="False">
                                    <ItemStyle HorizontalAlign="Left" Width="0px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="stationName" ItemStyle-CssClass="input12" HeaderStyle-HorizontalAlign="Left"
                                    ShowHeader="False">
                                    <ItemStyle HorizontalAlign="Center" Width="500px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Literal runat="server" ID="lit1" Text="</td><tr id='trCollapseGrid' ><td colspan='5'>" />
                                        <asp:GridView ID="gvChild" AutoGenerateColumns="False" runat="server" EnableViewState="False"
                                            ForeColor="#000000" CssClass="input12" AutoGenerateSelectButton="False" OnRowUpdating="gvChild_RowUpdating"
                                            GridLines="Horizontal" RowStyle-HorizontalAlign="Center" EmptyDataRowStyle-HorizontalAlign="Center">
                                            <RowStyle BackColor="#ffffff" HorizontalAlign="Center" />
                                            <AlternatingRowStyle BackColor="#a5a29f" HorizontalAlign="Center" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:HiddenField ID="stationID" Value='<%# Bind("stationID") %>' runat="server" />
                                                        <asp:HiddenField ID="alertID" Value='<%# Bind("alertID") %>' runat="server" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CheckBoxField DataField="SMS" HeaderText="SMS" ItemStyle-Width="120px">
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:CheckBoxField>
                                                <asp:CheckBoxField DataField="MMS" HeaderText="MMS" ItemStyle-Width="120px">
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:CheckBoxField>
                                                <asp:CheckBoxField DataField="Email" HeaderText="E-mail" ItemStyle-Width="120px">
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:CheckBoxField>
                                                <asp:CheckBoxField DataField="Cell" HeaderText="Voice/Phone" ItemStyle-Width="120px">
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:CheckBoxField>
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnkButtonupdate" CommandName="Update" CommandArgument='<%# Eval("stationID") %>'
                                                            Text="Update" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="#a5a29f" Font-Bold="True" ForeColor="White" />
                                        </asp:GridView>
                                        <asp:Literal runat="server" ID="lit2" Text="</td></tr>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#B5B8BC" BorderStyle="None" />
                            <AlternatingRowStyle BackColor="#B5B8BC" />
                        </asp:GridView>
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="AccordionPane5" runat="server" ContentCssClass="" HeaderCssClass=""
                    Height="340px">
                    <Header>
                        Blackout Schedules</Header>
                    <Content>
                        <div class="ProfileContainer_Text">
                            The blacklist schedule is a list of times that you would like to have your alerts NON-ACTIVE.  If you set a DAILY REOCCURING schedule for PHONE from 07:00 to 17:00, you will NOT receive PHONE alerts during this time every day.  To set a blackout overnight, please add two scheduled items (example: 15:00-24:00 and 00:00 - 07:00 will prevent alerts from 3:00pm-7:00am). 
                            To remove an alert, click the "X" button to the right of the alert schedule.
                        </div>
                     <asp:FormView ID="fvAddAlertSchedule" runat="server" CellPadding="4" DataSourceID="sqlAddAlertSchedule"
                            ForeColor="Black" BackColor="White" DefaultMode="Insert">
                            <EditRowStyle BackColor="White" ForeColor="Black" />
                            <InsertItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr style="font-weight: bold">
                                        <td >
                                            Station
                                        </td>
                                        <td>
                                            Mode
                                        </td>
                                        <td>
                                            Interval
                                        </td>
                                        <td>
                                            Day
                                        </td>
                                        <td >
                                            Reoccuring
                                        </td>
                                        <td>
                                            Start Time
                                        </td>
                                        <td>
                                            End time
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlStationID" runat="server" CssClass="input12" DataSourceID="sqlSelectedStations"
                                                DataTextField="StationName" DataValueField="stationID">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlAlertType" runat="server" DataSourceID="sqlAlertModes"
                                                DataTextField="alertType" DataValueField="alertTypeID" CssClass="input12">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlAlertInterval" runat="server" DataSourceID="sqlAlertIntervals"
                                                DataTextField="alertinterval" DataValueField="alertIntervalID" CssClass="input12">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlAlertDay" runat="server" CssClass="input12">
                                                <asp:ListItem Value="0">Sunday</asp:ListItem>
                                                <asp:ListItem Value="1">Monday</asp:ListItem>
                                                <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                <asp:ListItem Value="4">Thursday</asp:ListItem>
                                                <asp:ListItem Value="5">Friday</asp:ListItem>
                                                <asp:ListItem Value="6">Saturday</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkAlertReoccuring" runat="server" CssClass="input12" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbAlertStartTime" runat="server" CssClass="input12"
                                                Text="00:00"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbAlertEndTime" runat="server" CssClass="input12"
                                                Text="00:00"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAddAlert" runat="server" CssClass="input12" Text="Add" 
                                                onclick="btnAddAlert_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </InsertItemTemplate>
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" />
                        </asp:FormView>
<asp:SqlDataSource ID="sqlAlertIntervals" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                                    SelectCommand="SELECT [alertIntervalID], [alertinterval] FROM [AlertIntervals]">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sqlAlertModes" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                                    SelectCommand="SELECT [alertTypeID], [alertType] FROM [AlertTypes] ORDER BY [alertType]">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sqlSelectedStations" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                                    SelectCommand="GetUserSelectedStations" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="contactID" SessionField="contactID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sqlAddAlertSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                                        InsertCommand="AddAlertSchedule" InsertCommandType="StoredProcedure" >
                                    <InsertParameters>
                                        <asp:SessionParameter Name="contactID" SessionField="contactID" Type="Int32" />
                                        <asp:ControlParameter ControlID="fvAddAlertSchedule$ddlstationID" Name="stationID" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="fvAddAlertSchedule$ddlAlertType" Name="alertType" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="fvAddAlertSchedule$ddlAlertInterval" Name="alertInterval" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="fvAddAlertSchedule$chkAlertReoccuring" Name="alertReoccuring" PropertyName="Checked" />
                                        <asp:ControlParameter ControlID="fvAddAlertSchedule$ddlAlertDay" Name="alertDay" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="fvAddAlertSchedule$tbAlertStartTime" Name="alertStartTime" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="fvAddAlertSchedule$tbAlertEndTime" Name="alertEndTime" PropertyName="Text" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                        <asp:GridView ID="gvAlertScheduleList" runat="server" AutoGenerateColumns="False"
                            CssClass="gvAlertScheduleList" DataSourceID="sqlGetAlertSchedules" GridLines="None"
                            Width="897px" DataKeyNames="alertScheduleID" ShowHeader="False">
                            <AlternatingRowStyle CssClass="input12" BackColor="#CEE7FF" />
                            <Columns>
                                <asp:TemplateField HeaderText="Station" SortExpression="Station" ItemStyle-Width="247">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Station") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mode" SortExpression="alertType">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("alertType") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("alertType") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interval" SortExpression="alertInterval">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("alertInterval") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("alertInterval") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Day" SortExpression="alertDay">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("alertDay") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("alertDay") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reoccuring" SortExpression="alertReoccuring">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("alertReoccuring") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("alertReoccuring") %>'
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Time" SortExpression="alertStartTime">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("alertStartTime") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("alertStartTime") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Time" SortExpression="alertEndTime">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alertEndTime") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("alertEndTime") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderStyle-BackColor="White">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete"
                                            Text="X" />
                                    </ItemTemplate>
                                    <ControlStyle CssClass="input12" />
                                    <ItemStyle CssClass="input12" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Left" />
                            <RowStyle CssClass="input12" HorizontalAlign="Center" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="sqlGetAlertSchedules" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
                            SelectCommand="GetAlertSchedule" SelectCommandType="StoredProcedure" DeleteCommand="DeleteAlertSchedule"
                            DeleteCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="1" Name="contactID" SessionField="contactID"
                                    Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="alertScheduleID" />
                            </DeleteParameters>
                        </asp:SqlDataSource>           
                    </Content>
                </asp:AccordionPane>
            </Panes>
        </asp:Accordion>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <br />

    </div>
</asp:Content>
