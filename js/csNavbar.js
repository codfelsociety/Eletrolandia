$(document).ready(function () {
    $(window).scroll(function () {
        //if you hard code, then use console
        //.log to determine when you want the 
        //nav bar to stick.  
        i = 0;
        var b = $('#top_area').height();
        console.log($(window).scrollTop())
        if ($(window).scrollTop() > b) {
            $('#nav_bar').addClass('navbar-fixed-top').fadeIn(1000);
            i = 1;
        }
        if ($(window).scrollTop() < b + 1 ) {
            $('#nav_bar').removeClass('navbar-fixed-top');
        }
    });
});