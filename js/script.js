$(document).ready(function () {
    $('.button', this).mouseenter(function () {
        $(this).addClass("changebutton");
    });
    $('.button', this).mouseleave(function () {
        $(this).removeClass("changebutton");
    });
    $('.changeback', this).focus(function () {
        $(this).addClass("profileView");
    });
    $('#txt_pass').focus(function () {
        $('.password_strength').show();
    }
    );
});


