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
  }

  if (environment === 'test') {

  }

  if (environment === 'production') {

  }

  return ENV;
};
