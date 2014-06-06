LoginController  = Ember.Controller.extend Ember.SimpleAuth.LoginControllerMixin,
  authenticatorFactory: "ember-simple-auth-authenticator:devise"

  registerable: true

  title: '用户登录'
  copyright: '&copy; 2014'

  supportedBrowers: [
    { name: 'Chrome', url: 'http://www.google.com/chrome', icon: '/images/chrome.png' }
    { name: 'Firefox', url: 'http://www.mozilla.org/en-US/firefox/new/', icon: '/images/firefox.png' }
    { name: 'Safari', url: 'http://www.apple.com/sg/safari/', icon: '/images/safari.png' }
    { name: 'IE 10+', url: 'http://windows.microsoft.com/en-sg/internet-explorer/ie-10-worldwide-languages', icon: '/images/ie.png' }
  ]

`export default LoginController`
