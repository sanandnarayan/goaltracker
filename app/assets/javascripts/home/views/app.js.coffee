views = window.todo.views
views.AppView = Backbone.View.extend
  el : $('body')
  initialize : ()->
    @newtodo = $('#newtodo')
    window.todo.vent = _.extend {}, Backbone.Events
    views.TomatoView  = new views.TomatoView
    views.TimeletView = new views.TimeletView
    views.UserView    = new views.UserView
    views.GoalsView    = new views.GoalsView
  events:
    "keypress #newtodo" : "addOnEnter"
  addOnEnter : (e) ->
    if e.charCode == 13
      entered_text = @newtodo.val()
      if entered_text.indexOf('@') > 0
        parts = entered_text.split('@')
        task_name  = parts[0]
        goal_name  = parts[1]
        goal_object = window.Goals.findOrCreate(goal_name)
        goal_object.createTask task_name
        @newtodo.val('')
      else
        console.log 'here'
        alert 'Enter a goal with @'
