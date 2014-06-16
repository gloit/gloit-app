`import Ember from 'ember'`

Router = Ember.Router.extend
  location: GloitAppENV.locationType

  storeURL: (->
    currentURL = @get('url')
    localStorage.setItem 'gloit-app:current-url', currentURL if currentURL != '/login'
  ).on('didTransition')


Router.map ->
  @route('login')
  @route('logout')

  @resource 'registrations', ->
    @route 'new'
    @route 'success'

  @resource 'authenticated', path: '/', ->
    @resource 'account', ->
      @route 'profile'
      @route 'password'

    @resource 'users', path: '/users', ->
      @route 'new'
      @resource 'user', path: '/:user_id'

`export default Router`
