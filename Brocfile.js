/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');

var app = new EmberApp({
  vendorFiles: {
    'es5-shim.js': 'vendor/es5-shim/es5-shim.js',
    'es5-sham.js': 'vendor/es5-shim/es5-sham.js'
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

app.import('vendor/html5shiv/dist/html5shiv.js', { destDir: 'assets' });
app.import('vendor/respond/dest/respond.min.js', { destDir: 'assets' });

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
app.import('vendor/notifier/notifier.js');
app.import('vendor/momentjs/moment.js');
app.import('vendor/momentjs/lang/zh-cn.js');

app.import('vendor/gloit-component/dist/globals/gloit-component.js');

var fontAwesomeAssets = pickFiles('vendor/font-awesome', {
  srcDir: 'fonts/',
  files: ['**/*'],
  destDir: '/fonts'
});

var bootstrapAssets = pickFiles('vendor/bootstrap', {
  srcDir: 'fonts/',
  files: ['**/*'],
  destDir: '/fonts'
});

var select2Assets = pickFiles('vendor/select2', {
  srcDir: '/',
  files: ['select2.png', 'select2x2.png'],
  destDir: '/assets'
});

var gloitComponentAssets = pickFiles('vendor/gloit-component', {
  srcDir: 'images/',
  files: ['**/*'],
  destDir: '/images'
});

module.exports = mergeTrees([app.toTree(), fontAwesomeAssets, bootstrapAssets, select2Assets, gloitComponentAssets]);
