/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');

var app = new EmberApp({
  vendorFiles: {
    'es5-shim.js': 'bower_components/es5-shim/es5-shim.js',
    'es5-sham.js': 'bower_components/es5-shim/es5-sham.js',
    'handlebars.js': {
      production:  'bower_components/handlebars/handlebars.js'
    }
  }
});

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.

app.import('bower_components/html5shiv/dist/html5shiv.js', { destDir: 'assets' });
app.import('bower_components/respond/dest/respond.min.js', { destDir: 'assets' });

app.import('bower_components/select2/select2.css');
app.import('bower_components/select2/select2-bootstrap.css');

app.import('bower_components/jquery.browser/dist/jquery.browser.js');
app.import('bower_components/cldr/plurals.js');
app.import('bower_components/ember-i18n/lib/i18n.js');
app.import('bower_components/bootstrap/dist/js/bootstrap.js');
app.import('bower_components/ember-list-view/index.js');
app.import('bower_components/ember-addons.bs_for_ember/dist/js/bs-core.max.js');
app.import('bower_components/ember-addons.bs_for_ember/dist/js/bs-button.max.js');
app.import('bower_components/ember-addons.bs_for_ember/dist/js/bs-modal.max.js');
app.import('bower_components/select2/select2.js');
app.import('bower_components/select2/select2_locale_zh-CN.js');
app.import('bower_components/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js');
app.import('bower_components/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js');
app.import('bower_components/notifier/notifier.js');
app.import('bower_components/momentjs/moment.js');
app.import('bower_components/momentjs/lang/zh-cn.js');
app.import('bower_components/ember-forms/dist/globals/main.js');
app.import('bower_components/ember-validations/index.js');

app.import('bower_components/gloit-component/dist/globals/gloit-component.js');

var fontAwesomeAssets = pickFiles('bower_components/font-awesome', {
  srcDir: 'fonts/',
  files: ['**/*'],
  destDir: '/fonts'
});

var bootstrapAssets = pickFiles('bower_components/bootstrap', {
  srcDir: 'fonts/',
  files: ['**/*'],
  destDir: '/fonts'
});

var select2Assets = pickFiles('bower_components/select2', {
  srcDir: '/',
  files: ['select2.png', 'select2x2.png'],
  destDir: '/assets'
});

var gloitComponentAssets = pickFiles('bower_components/gloit-component', {
  srcDir: 'images/',
  files: ['**/*'],
  destDir: '/images'
});

module.exports = mergeTrees([app.toTree(), fontAwesomeAssets, bootstrapAssets, select2Assets, gloitComponentAssets]);
