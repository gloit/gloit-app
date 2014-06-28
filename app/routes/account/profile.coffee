ProfileRoute = Ember.Route.extend
  model: -> @get('session.currentUser')

`export default ProfileRoute`
