# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


tomato_length = 1 * 60 # seconds
$(document).ready ->

  # making the sortable
  goal_box = $("#goal_box")
  goals    = $('.tasks')
  goal_box.masonry
    itemSelector: ".goal"
    isResizable: true

  goal_box.sortable
    distance: 12
    forcePlaceholderSize: true
    items: ".goal"
    placeholder: "card-sortable-placeholder goal"
    tolerance: "pointer"
    start: (event, ui) ->
      ui.item.addClass("dragging").removeClass "goal"
      ui.item.parent().masonry "reload"

    change: (event, ui) ->
      ui.item.parent().masonry "reload"

    stop: (event, ui) ->
      ui.item.removeClass("dragging").addClass "goal"
      ui.item.parent().masonry "reload"

  goals.sortable()

  # now the timers
  task_timer = $('#timer').stopwatch()
  tomato_timer = $('#tomato_timer').stopwatch()

  $('#tomato_squash').click ()->
    tomato_timer.stopwatch 'stop'
    tomato_timer.data('stopwatch').elapsed = 0
    tomato_timer.stopwatch 'render'
    tomato_timer.trigger 'tick.stopwatch'

  $('#stop').click ()->
    task_timer.stopwatch 'stop'
    task_timer.data('stopwatch').elapsed = 0
    task_timer.stopwatch 'render'
    $('#tomato_squash').trigger 'click'

  $('.tasks .btn').click ()->
    task_data  = task_timer.data('stopwatch')
    tomato_data  = tomato_timer.data('stopwatch')
    if not task_data.active
      task_timer.stopwatch 'start'
    else
      task_timer.stopwatch 'reset'

    if not tomato_data.active
      tomato_timer.stopwatch 'start'

    tomato_timer.bind 'tick.stopwatch', (a,b)->
      b = b || 0
      elapsed_minutes = b/1000
      percentage = elapsed_minutes/tomato_length * 100
      width = Math.floor(percentage)
      $('#tomato_bar').width width
      if elapsed_minutes == tomato_length
        tomato_timer.stopwatch 'reset'
      

