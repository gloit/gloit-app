`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

AuthenticatedRoute = Ember.Route.extend AuthenticatedRouteMixin,
  beforeModel: (transition) ->
    @_super(transition)

    if @get('session.isAuthenticated')
      url = localStorage.getItem('gloit-app:current-url')
      @transitionTo url || 'authenticated'

`export default AuthenticatedRoute`
