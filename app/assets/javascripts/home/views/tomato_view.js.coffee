window.todo.views.TomatoView = Backbone.View.extend
  el : '#tomato'
  initialize : ()->
    @tomato_timer = @$('#tomato_timer').stopwatch()
    @bar = @$('#tomato_bar')
    @tomato_length = window.tomato_length
    @tomato_timer.bind 'tick.stopwatch', (e,millis) => @tick(e, millis)
    window.todo.vent.on 'task.begin', @start_tomato, this
    window.todo.vent.bind 'task_timer.stopped', @stop_tomato, this

  events :
    "click #tomato_squash" : "stop_tomato"

  tick : (event, millis) ->
    @update_bar millis
    if millis == @tomato_length * 60 * 1000
      @pomodoro_done()

  pomodoro_done : ()->
    @tomato_timer.stopwatch 'reset'

  update_bar : (millis)->
    millis = millis || 0
    elapsed_minutes = millis/1000
    percentage = elapsed_minutes/tomato_length * 100
    width = Math.floor(percentage)
    @bar.width width

  start_tomato:()->
    #FIXME, i dont this needs the if condition
    if not @tomato_timer.data('stopwatch').active
      @tomato_timer.stopwatch 'start'

  stop_tomato: ()->
    @tomato_timer.stopwatch 'stop'
    @tomato_timer.stopwatch 'reset'
    @tomato_timer.stopwatch 'render'
    @tomato_timer.trigger 'tick.stopwatch'
