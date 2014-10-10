/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'gloit-app',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },
    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src': "'self' 'unsafe-eval'",
      'font-src': "'self'",
      'connect-src': "'self' http://localhost:3000", // Allow data (ajax/websocket) from http://localhost:3000
      'img-src': "'self' http://localhost:4200",
      'style-src': "'self' 'unsafe-inline'",
      'media-src': "'self'"
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
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'auto';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
    ENV.baseURL = '/gloit-app';

    ENV.APP.api = {
      host: 'http://ffers-webapi.gloit.cn',
      namespace: 'v1',
      baseUrl: 'http://ffers-webapi.gloit.cn/v1'
    };

    ENV['simple-auth']['crossOriginWhitelist'] = ["http://ffers-webapi.gloit.cn"];
    ENV['simple-auth-devise']['serverTokenEndpoint'] = "http://ffers-webapi.gloit.cn/users/sign_in";
  }

  return ENV;
};
