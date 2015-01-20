<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/control/Admin.master" CodeBehind="MassMessage.aspx.vb" Inherits="AlternateAlerts_Web.MassMessage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
    <script type="javascript">
        function ChangeIndex(controlID) {

            var accHost = $find(controlID);
            var i = accHost.get_SelectedIndex() + 1;
            accHost.set_SelectedIndex(i);
        }  
    </script>
    <script type="text/javascript">
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
    <script type="text/javascript">
        function getOffset() {
            var d = new Date();
            var n = d.getTimezoneOffset();
            var offset = -(n / 60);
            document.getElementById('<%=timeOffset.ClientID%>').value = offset;
        }
    </script>
    <link href="/Styles/Master.css" rel="stylesheet" type="text/css" />
    <link href="/styles/style.css" rel="stylesheet" type="text/css" />
    <div style="width: 100%; margin-left: auto; margin-right: auto; margin-top: 25px;">
        <asp:Panel ID="panelSuccess" runat="server" Visible="false" >
            <h4><br />
                <asp:Label ID="lblSuccessMessage" runat="server" Text="Label" CssClass="alert-success"></asp:Label>
                <br />
            </h4>
        </asp:Panel>
        <h4>This tools provides the ability to send a mass message to all members of your organization.</h4><br />
        <h4>Step 1: Select methods of delivery</h4>
        <asp:CheckBoxList ID="checklistDelivery" runat="server" AutoPostBack="True" CellPadding="5" CellSpacing="0" RepeatColumns="3" RepeatDirection="Horizontal" Width="650px">
            <asp:ListItem Value="0">SMS (Text msg)</asp:ListItem>
            <asp:ListItem Value="1">MMS (Text msg)</asp:ListItem>
            <asp:ListItem Value="2">Voice/Phone</asp:ListItem>
        </asp:CheckBoxList>
        <asp:HiddenField runat="server" ID="timeOffset" /><br />
        <h4>Step 2: Select the department(s) to receive the SMS/Email/Voice Call</h4>
        <asp:CheckBoxList ID="checklistStations" runat="server" DataSourceID="sqlGetContactStations" DataTextField="FullStationName" DataValueField="stationID" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="0" TextAlign="Right" Width="700px"></asp:CheckBoxList>
        <asp:SqlDataSource ID="sqlGetContactStations" runat="server" ConnectionString="<%$ ConnectionStrings:TonesToTextConnectionString %>"
            SelectCommand="GetContactStations" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="contactID" SessionField="contactID"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource><br />
        <h4>Step 3: Enter message to be delivered</h4>
        <asp:TextBox ID="tbMessage" runat="server" Height="89px" TextMode="MultiLine" Width="650px"></asp:TextBox><br />
        <asp:Panel ID="panelVoiceMessage" runat="server" Visible="False"><br />
            <h4>Step 4: If Voice/Phone message, enter phoneticly correct message</h4>
            <asp:TextBox ID="tbVoiceMessage" runat="server" Height="89px" TextMode="MultiLine" Width="650px"></asp:TextBox><br />
            Phone Number:
            <asp:TextBox runat="server" ID="tbTextNumber" Columns="12" MaxLength="12" Wrap="False"></asp:TextBox>
            <p style="font-size: small">Clicking the test will send a test call to the phone number you have specified. You can do this numerous times to get your message correct.</p>
            <asp:Button ID="btnTestVoice" runat="server" Text="Test Voice Message" /><br />
        </asp:Panel>
        <h4>Final Step: Submit for delivery</h4>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Message for Delivery" OnClientClick="getOffset();" />
        <br />
        <br />
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
</asp:Content>
