<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/control/Admin.master"
    CodeBehind="Members.aspx.vb" Inherits="AlternateAlerts_Web.Members" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminContentPlaceholder" runat="server">
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
    <link href="/Styles/Master.css" rel="stylesheet" type="text/css" />
    <link href="/styles/style.css" rel="stylesheet" type="text/css" />
    <br />
    <br />
    <asp:Accordion ID="accordionProfile" runat="server" Width="100%" ContentCssClass=""
        FramesPerSecond="30" HeaderCssClass="AccordionPanelTab" HeaderSelectedCssClass="AccordionPanelTabSelected">
        <Panes>
            <asp:AccordionPane ID="AccordionPane1" runat="server" ContentCssClass="" HeaderCssClass="">
                <Header>
                    My Members</Header>
                <Content>
                    <div style="width: 100%; margin-left: auto; margin-right: auto; margin-top: 25px;">
                        <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvMembers_RowDataBound"
                            CellPadding="4" ForeColor="#333333" BorderStyle="None" GridLines="None" Width="100%"
                            ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="img1" ImageUrl="/images/Collapse.gif" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="contactID" ShowHeader="false" ItemStyle-CssClass="hidden" />
                                <asp:BoundField DataField="contactName" ShowHeader="false" ItemStyle-CssClass="memberList" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandArgument='<%# Eval("contactID").ToString() +"|"+ Eval("contactName").ToString() %>'
                                            OnCommand="btnLoginAs_Command" ID="btnLoginAs" Text="Login as" CssClass="memberList" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="false">
                                    <ItemTemplate>
                                        <asp:Literal runat="server" ID="lit1" Text="</td><tr id='trCollapseGrid' style='display: none;' ><td colspan='5'>" />
                                        <asp:GridView runat="server" ID="gvChild" AutoGenerateColumns="false" EnableViewState="False"
                                            GridLines="None" CssClass="memberListSub" ShowHeader="false" DataKeyNames="contactID"
                                            Width="75%" HorizontalAlign="Right">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:HiddenField ID="stationID" Value='<%# Bind("stationID") %>' runat="server" />
                                                        <asp:HiddenField ID="contactID" Value='<%# Bind("contactID") %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemTemplate>
                                                        &#149;&nbsp;
                                                        <asp:Label ID="Agency" Text='<%# Bind("Agency") %>' runat="server" />
                                                        &nbsp;-&nbsp;
                                                        <asp:Label ID="Station" Text='<%# Bind("station") %>' runat="server" />
                                                        <asp:LinkButton ID="delMemberStation" CommandArgument='<%# Eval("contactID").ToString()+"|"+Eval("stationID").ToString() %>'
                                                            OnCommand="delMemberStation_Command" runat="server" Text="(Remove from Station)"
                                                            Font-Size="X-Small"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </Content>
            </asp:AccordionPane>
        </Panes>
    </asp:Accordion>
    <br />
    <div>
        <a class="btn" data-toggle="modal" data-href="/control/modal_xref_memberstation.aspx">
            <i class="icon-plus"></i>Add Member to Station</a>
        <div class="modal hide" id="modalMemberStation">
            <script type="text/javascript">
                jQuery(function ($) {
                    // find all tr's with a data-href attribute
                    $('div a[data-href]').click(function () {
                        // copy the data-href value to the modal for later use
                        $('#modalMemberStation').attr('data-href', $(this).attr('data-href'));
                        // show the modal window
                        $('#modalMemberStation').modal({ show: true, backdrop: true, keyboard: true });
                    }).find('a').hover(function () {
                        // unbind it in case I put some a tags in the table row eventually
                        $(this).parents('div').unbind('click');
                    }, function () {
                        $(this).parents('div').click(function () {
                            // rebind it
                            $('#modalMemberStation').attr('data-href', $(this).attr('data-href'));
                            $('#modalMemberStation').modal({ show: true, backdrop: true, keyboard: true });
                        });
                    });

                    // when the modal show event fires, load the url that was copied to the data-href attribute
                    $('#modalMemberStation').bind('show', function () {
                        $(this).load($(this).attr('data-href'));
                    });
                });                                        
            </script>
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
</asp:Content>
