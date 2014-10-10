`import Ember from 'ember'`
`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`
`import config from '../config/environment'`

LoginController  = Ember.Controller.extend LoginControllerMixin,
  authenticator: "authenticator:gloit-app"

  registerable: true

  title: '用户登录'
  copyright: '&copy; 2014'

  supportedBrowers: [
    { name: 'Chrome', url: 'http://www.google.com/chrome', icon: config.baseURL + 'images/chrome.png' }
    { name: 'Firefox', url: 'http://www.mozilla.org/en-US/firefox/new/', icon: config.baseURL + 'images/firefox.png' }
    { name: 'Safari', url: 'http://www.apple.com/sg/safari/', icon: config.baseURL + 'images/safari.png' }
    { name: 'IE 10+', url: 'http://windows.microsoft.com/en-sg/internet-explorer/ie-10-worldwide-languages', icon: config.baseURL + 'images/ie.png' }
  ]

`export default LoginController`
