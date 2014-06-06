`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

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

App = Ember.Application.extend
  modulePrefix: 'gloit-app', # TODO: loaded via config
  Resolver: Resolver

loadInitializers(App, 'gloit-app')

`export default App`
