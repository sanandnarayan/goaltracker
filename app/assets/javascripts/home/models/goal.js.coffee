todo = window.todo
todo.models.Goal = Backbone.Model.extend
  defaults : ->
    name     : "empty goal"
    position : Goals.nextPosition()
    archived : false
  initialize:()->
    @tasks = new todo.collections.TaskCollection undefined,
      goal: this
  addTasks : (tasks)->
    @tasks.add tasks
  createTask : (name)->
    @tasks.create name:name, goal_id: @id
  getTasks : ()->
    $.getJSON 'goals/' + @id + '/tasks', (response) =>
      @addTasks response
