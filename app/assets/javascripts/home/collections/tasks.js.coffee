window.todo.collections.TaskCollection = Backbone.Collection.extend
  model: window.todo.models.Todo
  url  : '/tasks/'
  initialize : (models, options)->
    @goal = options.goal
    @goal.getTasks() unless @goal.isNew()
  comparator: (todo) ->
    todo.get('position')
  nextPosition : ()->
    return 1  unless @length
    @last().get("position") + 1
  updatePosition: (s) ->
    temp = _.map s.split('&'), (id) ->
      id.split('=')[1]
    _.each temp, (id, index) =>
      @get(id).save position: index+1
