window.todo.views.GoalView = Backbone.View.extend
  className: "goal"
  goalTemplate : _.template($('#goal_template').html())
  initialize:()->
    @model.tasks.on('add', @addTask, this)
  
  addTask : (model)->
    task_view = new window.todo.views.TaskView
      model: model
    task_view.render()
    $(@el).children('.tasks').append task_view.el
    $(@el).sortable
      items: '.task'
      stop : (event, ui)=>
        @model.tasks.updatePosition $(@el).sortable('serialize')
    window.todo.vent.trigger 'task.added'
  

  render : ()->
    $(@el).html @goalTemplate @model.toJSON()
    $(@el).attr 'id', "goal_" + @model.get 'id'
    this
