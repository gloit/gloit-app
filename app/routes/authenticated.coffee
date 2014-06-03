AuthenticatedRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  beforeModel: (transition) ->
    @_super(transition)

    if @get('session.isAuthenticated')
      url = localStorage.getItem('gloit-app:current-url')
      @transitionTo url || '/'

`export default AuthenticatedRoute`
