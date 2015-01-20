<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="modal_xref_memberstation.aspx.vb"
    Inherits="AlternateAlerts_Web.modal_xref_memberstation" %>

<form id="Form1" runat="server">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">
        ×</button>
    <h3>
        Add Member to Station</h3>
</div>
<div class="modal-body">
    <asp:dropdownlist id="ddlMembers" runat="server">
                                </asp:dropdownlist>
    <--->
    <asp:dropdownlist id="ddlStations" runat="server">
                                </asp:dropdownlist>
</div>
<div class="modal-footer">
    <a href="#" class="btn" data-dismiss="modal">Close</a> 
    <asp:linkbutton id="save" runat="server" cssclass="btn btn-primary" 
        text="Save Changes" PostBackUrl="~/control/modal_xref_memberstation.aspx" 
        ViewStateMode="Enabled" ></asp:linkbutton>
</div>
</form>
