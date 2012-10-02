# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

show_event_pane_for = (element)->
  $('#add_event').removeClass('hidden')

$('td.day').live 'click', ->
  if $(this).hasClass('no_event')
    $(this).addClass('event_stub')
    show_event_pane_for(this)
    #$(this).removeClass('no_event').addClass('event_stub')
  else
    show_event_pane_for(this)


