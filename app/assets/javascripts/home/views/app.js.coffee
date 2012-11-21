views = window.todo.views
views.AppView = Backbone.View.extend
  el : $('body')
  initialize : ()->
    window.todo.vent = _.extend {}, Backbone.Events
    views.TomatoView  = new views.TomatoView
    views.TimeletView = new views.TimeletView
    views.UserView    = new views.UserView
    views.GoalsView    = new views.GoalsView
