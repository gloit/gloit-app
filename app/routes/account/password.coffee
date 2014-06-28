PasswordRoute = Ember.Route.extend
  model: -> @get('session.currentUser')

`export default PasswordRoute`
