#= require websocket_rails/main
#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require modernizr
#= require turbolinks
#= require geolocation
#= require jquery
#= require owl.carousel
#= require_self

# for more details see: http://emberjs.com/guides/application/
# // #= require ember
# // #= require ember-data
# // #= require twalk2
# window.Twalk2 = Ember.Application.create()

$ ->

  windowHeightz0r = ->
    $(".screen-pane").each ->
      $(this).height $(window).height() + "px"
      return

    return

  windowHeightz0r()
  $(window).resize ->
    windowHeightz0r()
    return

  $('.flash-messages').find('.alert').each ->
    $(this).delay(4000).fadeOut();
    return

  return

  
