/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');

var app = new EmberApp({
  name: require('./package.json').name,

  minifyCSS: {
    enabled: true,
    options: {}
  },

  getEnvJSON: require('./config/environment')
});

// Use this to add additional libraries to the generated output files.
app.import('vendor/ember-data/ember-data.js');

// If the library that you are including contains AMD or ES6 modules that
// you would like to import into your application please specify an
// object with the list of modules as keys along with the exports of each
// module as its value.
app.import('vendor/ic-ajax/dist/named-amd/main.js', {
  'ic-ajax': [
    'default',
    'defineFixture',
    'lookupFixture',
    'raw',
    'request',
  ]
});

app.import('vendor/select2/select2.css');
app.import('vendor/select2/select2-bootstrap.css');

app.import('vendor/jquery.browser/dist/jquery.browser.js');
app.import('vendor/cldr/plurals.js');
app.import('vendor/ember-i18n/lib/i18n.js');
app.import('vendor/bootstrap/dist/js/bootstrap.js');
app.import('vendor/ember-list-view/index.js');
app.import('vendor/ember-addons.bs_for_ember/dist/js/bs-core.max.js');
app.import('vendor/ember-addons.bs_for_ember/dist/js/bs-button.max.js');
app.import('vendor/ember-addons.bs_for_ember/dist/js/bs-modal.max.js');
app.import('vendor/select2/select2.js');
app.import('vendor/select2/select2_locale_zh-CN.js');
app.import('vendor/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js');
app.import('vendor/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js');
app.import('vendor/ember-simple-auth/ember-simple-auth.js');
app.import('vendor/ember-simple-auth/ember-simple-auth-devise.js');
app.import('vendor/notifier/notifier.js');

app.import('vendor/gloit/dist/globals/gloit.js');

var fontAwesomeAssets = pickFiles('vendor/font-awesome', {
   srcDir: 'fonts/',
   files: ['**/*'],
   destDir: '/fonts'
});

var gloitAssets = pickFiles('vendor/gloit', {
   srcDir: 'images/',
   files: ['**/*'],
   destDir: '/images'
});

module.exports = mergeTrees([app.toTree(), fontAwesomeAssets, gloitAssets]);
