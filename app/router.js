import Ember from 'ember';

var Router = Ember.Router.extend({
  location: GloitAppENV.locationType,

  storeURL: function() {
    var currentURL = this.get('url');
    if(currentURL !== '/login') {
      localStorage.setItem('gloit-app:current-url', currentURL);
    }
  }.on('didTransition')
});

Router.map(function() {
  this.route('login');
  this.route('logout');

  this.resource('registrations', function() {
    this.route('new');
    this.route('success');
  });

  this.resource('authenticated', { path: '/' }, function() {
    this.resource('account', function() {
      this.route('profile');
      this.route('password');
    });

    this.resource('users', { path: '/users' }, function() {
      this.route('new');
      this.resource('user', { path: '/:user_id' });
    });
  });
});

export default Router;
