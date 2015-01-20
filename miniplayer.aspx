<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="miniplayer.aspx.vb" Inherits="AlternateAlerts_Web.miniplayer1" %>

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3><%#Request("Station")%></h3>
    </div>
    <div class="modal-body">
    <h5><%#Request("Station")%> dispatched on <%#Request("timestamp")%></h5>
        <div align="center" class="Player">
        <br />

            <object type="application/x-shockwave-flash" data="http://flash-mp3-player.net/medias/player_mp3_mini.swf"
                width="200" height="20">
                <param name="movie" value="player_mp3_mini.swf" />
                <param name="bgcolor" value="#c5132f" />
                <param name="FlashVars" value="mp3=<%# recordingFileName%>&amp;autoplay=1" />
            </object>
        </div>
        <div>
        <br /><br />
            <p style="font-size:10px;">
                <a href="<%# noflashURL%>">No flash? Click here
                    to listen...</a></p>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn btn-primary" data-dismiss="modal">Close</a>
    </div>
