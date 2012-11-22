window.todo.models.Timelet = Backbone.Model.extend
  urlRoot: '/timelets'
  initialize :()->
    console.log 'timelet has been initialized'
  done:()->
    @save to: new Date()
  start:()->
    @save from: new Date()
