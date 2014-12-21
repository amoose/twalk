//= require jquery
//= require jquery_ujs
//= require websocket_rails/main


$(function () {
  var max = parseInt($(window).height() * 0.8);
  $('section img').css('max-height',max+'px');


  $('.fadeIn').each(function(i) {
    $(this).delay((i++) * 500).fadeTo(500, 1);
  });

  $('.presentation-navigation').width(parseInt($(window).width() * 0.18)+"px");
    
});