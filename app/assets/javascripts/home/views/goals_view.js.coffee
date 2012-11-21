window.todo.views.GoalsView = Backbone.View.extend
  el : '#goal_box'
  initialize : ()->
    _.bindAll this
    Goals = window.Goals = new window.todo.collections.Goals
    Goals.bind('add', @addGoal, this)
    Goals.bind('reset', @addAllGoals, this)
    window.todo.vent.bind 'task.added', @masonryReload
    window.todo.vent.bind 'goal.archived', @masonryReload

    $(@el).masonry
      itemSelector: ".goal"
      isResizable: true

    $(@el).sortable
      forcePlaceholderSize: true
      placeholder: "card-sortable-placeholder goal"
      items: ".goal"
      start: (event, ui) ->
        ui.item.addClass("dragging").removeClass "goal"
        ui.item.parent().masonry "reload"

      change: (event, ui) ->
        ui.item.parent().masonry "reload"

      stop: (event, ui) =>
        ui.item.removeClass("dragging").addClass "goal"
        ui.item.parent().masonry "reload"
        Goals.updatePosition $(@el).sortable('serialize')

  addAllGoals: (collection)->
    _.each collection.models, @addGoal

  addGoal : (model)->
    todo = window.todo
    view = new todo.views.GoalView(model: model)
    view.render()
    $(@el).append view.el
    $(@el).masonry "reload"

  masonryReload : ()->
    $(@el).masonry "reload"

