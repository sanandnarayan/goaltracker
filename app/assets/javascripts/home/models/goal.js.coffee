todo = window.todo
todo.models.Goal = Backbone.Model.extend
  initialize:()->
    @tasks = new todo.collections.TaskCollection undefined,
      goal: this
  getTasks : ()->
    $.getJSON 'goals/' + @id + '/tasks', (response) =>
      @tasks.add response
