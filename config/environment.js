/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created

      api: {
        host: 'http://localhost:4200',
        namespace: 'api',
        baseUrl: 'http://localhost:4200/api'
      }
    }
  };

  ENV['simple-auth'] = {
    authorizer: 'authorizer:gloit-app',
    routeAfterAuthentication: 'authenticated',
    crossOriginWhitelist: ["http://localhost:4200"]
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;

    ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;

    // Using the default support compiler of ember-i18n.
    ENV.I18N_COMPILE_WITHOUT_HANDLEBARS = true;
  }

  if (environment === 'test') {
    ENV.baseURL = '/'; // Testem prefers this...
  }

  if (environment === 'production') {
    ENV.baseURL = '/gloit-app';

    ENV.APP.api = {
      host: 'http://ffers-webapi.gloit.cn',
      namespace: 'v1',
      baseUrl: 'http://ffers-webapi.gloit.cn/v1'
    };

    ENV['simple-auth']['crossOriginWhitelist'] = ["http://ffers-webapi.gloit.cn"];
  }

  return ENV;
};
