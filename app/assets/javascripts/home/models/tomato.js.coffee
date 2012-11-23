window.todo.models.Tomato = Backbone.Model.extend
  urlRoot: '/tomatoes'
  initialize :()->
    # console.log 'tomato has been initialized'
  done:()->
    @save to: new Date()
    localStorage.removeItem 'currentTomato'
  start:()->
    @save(from: new Date(), {success: ()=>@localstorage()})
  localstorage:()->
    localStorage.setItem 'currentTomato', JSON.stringify @attributes

