window.todo.views.TaskView = Backbone.View.extend
  tagName: 'li'
  taskTemplate : _.template($('#task_template').html())
  initialize : ()->
    console.log "TaskView has been initialized"
  events:
    "click .btn" : "task_begin"
  task_begin : ->
    window.todo.vent.trigger 'task.begin'
    console.log 'ere'
  render : ()->
    $(@el).html @taskTemplate @model.toJSON()
    this

