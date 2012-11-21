window.todo.views.TimeletView = Backbone.View.extend
  el : '#timelet'
  initialize : ()->
    console.log "TimeletView has been initialized"
    @task_timer = @$('#timer').stopwatch()
    window.todo.vent.on 'task.begin', @start_timer, this


  events :
    "click #stop" : "stop_timer"

  stop_timer: ()->
    @reset_timer()
    @task_timer.stopwatch 'stop'
    @task_timer.stopwatch 'render'
    window.todo.vent.trigger 'task_timer.stopped'

  start_timer: ->
    task_data  = @task_timer.data('stopwatch')
    if not task_data.active
      @task_timer.stopwatch 'start'
    else
      @reset_timer()

  reset_timer: ->
      @task_timer.stopwatch 'reset'
