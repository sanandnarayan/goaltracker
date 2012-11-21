window.todo.models.Todo = Backbone.Model.extend
  defaults : ->
    name     : "empty todo"
  initialize: ()->
    console.log 'Todo initialized'
