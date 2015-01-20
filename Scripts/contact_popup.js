
//0 means disabled, 1 mean enabled
var popupContactStatus = 0;

function loadTaskPopup() {
    if (popupTaskStatus == 0) {
        $("#backgroundContactPopup").css({
            "opacity": "0.7"
        });
        $("#backgroundContactPopup").fadeIn("slow");
        $("#popupContact").fadeIn("slow");
        popupTaskStatus = 1;
    }
}

function disableContactPopup() {
    if (popupContactStatus == 1) {
        $("#popupContact").fadeOut("slow");
        $("#backgroundContactPopup").fadeOut("slow");
        popupContactStatus = 0;
    }
}

function centerContactPopup() {
    var windowWidth = document.documentElement.clientWidth;
    var windowHeight = document.documentElement.clientHeight;
    var popupHeight = $("#popupContact").height();
    var popupWidth = $("#popupContact").width();

    $("#popupContact").css({
        "position": "absolute",
        "top": windowHeight/2-popupHeight/2,
        "left": windowWidth / 2 - popupWidth / 2
    });
}

