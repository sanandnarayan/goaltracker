window.todo.models.Todo = Backbone.Model.extend
  defaults : ->
    name     : "empty todo"
    archived : false
    done     : false
  initialize: ()->
    console.log 'Todo initialized'
  delete:()->
    @save archived:true
  done:()->
    @save done:true
