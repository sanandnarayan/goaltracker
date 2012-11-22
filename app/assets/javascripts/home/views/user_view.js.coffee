window.todo.views.UserView = Backbone.View.extend
  el  : $('#user_tomatoes')
  initialize : ()->
    window.todo.vent.on 'tomato.stopped', @refreshTomatoes, this
    @refreshTomatoes()
  refreshTomatoes:()->
    $.get '/user/tomatoes', (response) =>
      tomatoes_done = response.tomatoes_done_today + " done"
      $(@el).html(tomatoes_done)

