//= require jquery
//= require jquery_ujs
//= require websocket_rails/main


$(function () {
  var max = parseInt($(window).height() * 0.8);
  $('section img').css('max-height',max+'px');
});