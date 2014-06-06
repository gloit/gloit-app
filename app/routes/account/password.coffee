PasswordRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: -> @get('session.currentUser')

`export default PasswordRoute`
