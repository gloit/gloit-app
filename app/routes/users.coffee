UsersRoute = Ember.Route.extend
  model: -> @store.find('user')

`export default UsersRoute`
