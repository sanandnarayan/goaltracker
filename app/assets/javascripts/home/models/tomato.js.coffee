window.todo.models.Tomato = Backbone.Model.extend
  urlRoot: '/tomatoes'
  initialize :()->
    console.log 'tomato has been initialized'
  done:()->
    @save to: new Date()
  start:()->
    @save from: new Date()
