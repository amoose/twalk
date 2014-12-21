//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require websocket_rails/main

window.Twalk2 = Ember.Application.create()

$(function () {
  


  $('.fadeIn').each(function(i) {
    $(this).delay((i++) * 500).fadeTo(500, 1);
  });

  // $('.presentation-navigation.expanded, .slide-navigation.expanded').width(parseInt($(window).width() * 0.18)+"px");
  $('.presentation-navigation, .slide-navigation').mouseenter(function () {
    $(this).addClass('expanded');
  }).mouseleave(function () {
    $(this).removeClass('expanded');
  });
  

  $('.flash-messages').change( function () {
    $('.flash-messages').find('.alert').each(function () {
      $(this).delay(500).fadeOut();
    });
  });

  $('.flash-messages').find('.alert').each(function () {
    $(this).delay(4000).fadeOut();
  });

  $(window).resize(function () {
    windowAdjust();
  });
});


function windowAdjust() {
  var max = parseInt($(window).height() * 0.8);
  $('section img').css('max-height',max+'px');

}