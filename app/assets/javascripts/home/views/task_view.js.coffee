window.todo.views.TaskView = Backbone.View.extend
  tagName: 'li'
  className: 'task'
  taskTemplate : _.template($('#task_template').html())
  initialize : ()->
    console.log "TaskView has been initialized"
  events:
    "click .btn" : "task_begin"
    "click .destroy": "delete"
    "click .toggle": "done"
  task_begin : ->
    window.todo.vent.trigger 'task.begin'
  render : ()->
    $(@el).html @taskTemplate @model.toJSON()
    $(@el).attr 'id', 'task_' + @model.get 'id'
    this
  delete: ()->
    @model.delete()
    $(@el).remove()
  done: ()->
    @model.done()

