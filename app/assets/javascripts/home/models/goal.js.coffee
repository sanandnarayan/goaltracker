todo = window.todo
todo.models.Goal = Backbone.Model.extend
  defaults : ->
    name     : "empty goal"
    position : window.Goals.nextPosition()
    archived : false
  initialize:()->
    @tasks = new todo.collections.TaskCollection undefined,
      goal: this
  addTasks : (tasks)->
    @tasks.add tasks
  createTask : (name)->
    unless @isNew()
      @tasks.create name:name, goal_id: @id
    else
      create_task = ()=>
        @tasks.create name:name, goal_id:@id
      _.delay(create_task, 1000)

  archive : ()->
    @save archived: true
  getTasks : ()->
    $.getJSON 'goals/' + @id + '/tasks', (response) =>
      @addTasks response
