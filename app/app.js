import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';

// Register helpers
import ptHelper from './helpers/pt';
Ember.Handlebars.registerBoundHelper('pt', ptHelper);

// Setup notifier
NotifierjsConfig.defaultTimeOut = 3000;
NotifierjsConfig.position = ["bottom", "right"];

// Import locale translations
import translations from './locales/zh-CN';
Ember.I18n.translations = translations;

Ember.MODEL_FACTORY_INJECTIONS = true;

Ember.Route.reopen({
  afterModel: function() {
    var _this = this;
    Ember.run.next(_this, function() {
      _this.controllerFor('application').send('currentPathDidChange');
    });
  },

  parentRoute: function() {
    var handlerInfos = this.router.router.state.handlerInfos;

    if(!handlerInfos) { return; }

    var parent = null;
    var current = null;
    var _this = this;

    handlerInfos.forEach(function(h) {
      current = h.handler;
      if(current === _this) { return false; }
      parent = current;
    });

    return parent;
  }
});

var App = Ember.Application.extend({
  modulePrefix: 'gloit-app', // TODO: loaded via config
  Resolver: Resolver
});

loadInitializers(App, 'gloit-app');

export default App;
