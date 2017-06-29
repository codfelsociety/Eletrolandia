$(document).ready(function () {
    $(window).scroll(function () {
        var b = $('#top_area').height();
        if ($(window).scrollTop() > b) {
            $('#nav_bar').addClass('fixed-top');
          //  $('#mini_logo').removeClass('hidden');
        }
        if ($(window).scrollTop() < b + 1 ) {
            $('#nav_bar').removeClass('fixed-top');
          //  $('#mini_logo').addClass('hidden');
        }
    });
});
