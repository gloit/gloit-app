UsersRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: -> @store.find('user')

`export default UsersRoute`
