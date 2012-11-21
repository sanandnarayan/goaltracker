window.todo.collections.TaskCollection = Backbone.Collection.extend
  model: window.todo.models.Todo
  url  : '/tasks/'
  initialize : (models, options)->
    @goal = options.goal
    @goal.getTasks()
