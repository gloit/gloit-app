`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`
`import config from './config/environment'`

# Register helpers
`import ptHelper from './helpers/pt'`
Ember.Handlebars.registerBoundHelper('pt', ptHelper)

# Setup notifier
NotifierjsConfig.defaultTimeOut = 3000
NotifierjsConfig.position = ["bottom", "right"]

# Import locale translations
`import translations from './locales/zh-CN'`
Ember.I18n.translations = translations

Ember.MODEL_FACTORY_INJECTIONS = true

Ember.Route.reopen
  afterModel: ->
    Ember.run.next @, =>
      @controllerFor('application').send('currentPathDidChange')

  parentRoute: ->
    handlerInfos = this.router.router.state.handlerInfos

    return unless handlerInfos

    handlerInfos.forEach (h) =>
      current = h.handler
      return false if (current == @)
      parent = current

    parent

App = Ember.Application.extend
  modulePrefix: config.modulePrefix
  podModulePrefix: config.podModulePrefix
  Resolver: Resolver

loadInitializers(App, config.modulePrefix)

`export default App`
