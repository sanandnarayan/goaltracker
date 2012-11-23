window.todo.models.Timelet = Backbone.Model.extend
  urlRoot: '/timelets'
  initialize :()->
    @localstorage()
    @on 'change', @localstorage, this
  done:()->
    @save to: new Date()
    localStorage.removeItem 'currentTimelet'
  start:()->
    @save(from: new Date(), {success: ()=>@localstorage()})
  localstorage:()->
    localStorage.setItem 'currentTimelet', JSON.stringify @attributes
