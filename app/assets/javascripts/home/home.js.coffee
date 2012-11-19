# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  t = $("#goal_box")
  t.masonry
    itemSelector: ".goal"
    isResizable: true

  t.sortable
    distance: 12
    forcePlaceholderSize: true
    items: ".goal"
    placeholder: "card-sortable-placeholder goal"
    tolerance: "pointer"
    start: (event, ui) ->
      ui.item.addClass("dragging").removeClass "goal"
      ui.item.parent().masonry "reload"

    change: (event, ui) ->
      ui.item.parent().masonry "reload"

    stop: (event, ui) ->
      ui.item.removeClass("dragging").addClass "goal"
      ui.item.parent().masonry "reload"
