`import Ember from 'ember'`

LogoutRoute = Ember.Route.extend
  beforeModel: ->
    @store.unloadAll(v.type) for _, v of @store.typeMaps
    @send('invalidateSession')

`export default LogoutRoute`
