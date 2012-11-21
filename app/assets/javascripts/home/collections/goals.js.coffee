Goal = window.todo.models.Goal
window.todo.collections.Goals = Backbone.Collection.extend
  model: Goal
  url  : '/goals/'
  nextPosition : ()->
    return 1  unless @length
    @last().get("position") + 1
  findOrCreate : (name)->
    goal = @where(name: name).pop()
    unless goal
      @create name: name, {wait: true}
    return goal
  comparator: (goal) ->
    goal.get('position')
  updatePosition: (s) ->
    temp = _.map s.split('&'), (id) ->
      id.split('=')[1]
    _.each temp, (id, index) =>
      @get(id).save position: index+1
