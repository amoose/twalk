#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require modernizr
#= require turbolinks
#= require websocket_rails/main
#= require geolocation
#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require owl.carousel
#= require_self
#= require twalk2

# for more details see: http://emberjs.com/guides/application/
window.Twalk2 = Ember.Application.create()

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

  return
