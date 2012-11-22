Tomato = window.todo.models.Tomato
window.todo.views.TomatoView = Backbone.View.extend
  el : '#tomato'
  initialize : ()->
    @current_tomato = null
    @tomato_timer = @$('#tomato_timer').stopwatch()
    @bar = @$('#tomato_bar')
    @tomato_length = window.tomato_length
    window.todo.vent.on 'task.begin', @start_tomato, this
    window.todo.vent.bind 'task_timer.stopped', @stop_tomato, this
    @tomato_timer.bind 'tick.stopwatch', (e,millis) => @tick(e, millis)
    @render()

  events :
    "click #tomato_squash" : "stop_tomato"

  # for every tick 
  # updates the progress bar
  # check if tomato is done and 
  tick : (event, millis) ->
    @update_bar millis
    # @current_tomato.localstorage() if @current_tomato
    if millis >= @tomato_length * 60 * 1000
      @tomato_done()

  # saves the current tomato and does the 
  # next action which is
  # start the next tomato
  tomato_done : ()->
    @tomato_timer.stopwatch 'reset'
    @stop_tomato()
    @start_tomato()
  
  render :()->
    @update_bar()
    @tomato_timer.stopwatch 'render'
    if @current_tomato then @$('#tomato_holder').show() else @$('#tomato_holder').hide()


  update_bar : (millis)->
    millis = millis || 0
    elapsed_minutes = millis/1000
    percentage = elapsed_minutes/tomato_length * 100
    width = Math.floor(percentage)
    @bar.width width

  start_tomato:()->
    @current_tomato = new Tomato
    @current_tomato.start()
    @tomato_timer.stopwatch 'start'
    @render()

  stop_tomato: ()->
    return unless @current_tomato
    @current_tomato.done()
    @tomato_timer.stopwatch 'stop'
    @tomato_timer.stopwatch 'reset'
    @current_tomato = null
    @render()
    window.todo.vent.trigger 'tomato.stopped'

  continueTimer:(currentTomato) ->
    @current_tomato = new Tomato currentTomato
    @tomato_timer.data('stopwatch').elapsed = (new Date() - new Date(currentTomato.from))
    @tomato_timer.stopwatch 'start'
    @render()
