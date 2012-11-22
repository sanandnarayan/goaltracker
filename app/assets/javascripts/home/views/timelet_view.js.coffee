Timelet = window.todo.models.Timelet
window.todo.views.TimeletView = Backbone.View.extend
  el : '#timelet'
  timer_template: _.template $('#timer_template').html()

  # The app has one timelet view
  # @current_timelet = model of current timer
  # @task_timer the stopwatch object
  initialize : ()->
    console.log 'timelet initizlied'
    @current_timelet = null
    @task_timer = @$('#timer').stopwatch()
    window.todo.vent.on 'task.begin', @start_timer, this
    @render()

  # appends the html to the #task_details of the timer element  
  # hides or shows the timer clock 
  render: ()->
    data = (if @current_timelet then @current_timelet.toJSON() else {task_name:false})
    html = @timer_template(data)
    @$('#task_details').html(html)
    @task_timer.stopwatch 'render'
    if @current_timelet then @$('#timer').show() else @$('#timer').hide()

  events :
    "click #stop" : "stop_timer"

  # calls stop function on model
  # calls stop function on task_timer
  # nulls the current timer
  # and renders
  stop_timer: ()->
    console.log 'task timer stopped'
    @current_timelet.done()
    @task_timer.stopwatch 'stop'
    @task_timer.stopwatch 'reset'
    window.todo.vent.trigger 'task_timer.stopped'
    @current_timelet = null
    @render()

  # makes the current timer
  # calls start function on model
  # calls start function on task_timer
  # and renders
  start_timer: (options)->
    task_data  = @task_timer.data('stopwatch')
    @stop_timer() if task_data.active
    @current_timelet = new Timelet (task_id: options.task_id, task_name: options.task_name)
    @current_timelet.start()
    @task_timer.stopwatch 'start'
    @render()
