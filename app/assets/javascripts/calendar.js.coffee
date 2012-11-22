#= require_self

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  # page is now ready, initialize the calendar...
  $("#calendar").fullCalendar
    height: 650
    header:
      left: "prev,next today"
      center: "title"
      right: "month,agendaWeek,agendaDay"
    defaultView: "agendaWeek"
    editable: true
    eventSources: [{
            url: '/calendar/data',
            color: 'green',
            textColor: 'white'
    }]
