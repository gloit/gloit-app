`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

  storeURL: (->
    currentURL = @get('url')
    localStorage.setItem('gloit-app:current-url', currentURL) unless currentURL == '/login'
  ).on('didTransition')

Router.map ->
  @route('login')
  @route('logout')

  @resource 'registrations', ->
    @route('new')
    @route('success')

  @resource 'authenticated', { path: '/' }, ->
    @resource 'account', ->
      @route('profile')
      @route('password')

    @resource 'users', { path: '/users' }, ->
      @route('new')
      @resource('user', { path: '/:user_id' })

`export default Router`
