`import Ember from 'ember'`
`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`
`import appConfig from '../config'`

LoginController  = Ember.Controller.extend LoginControllerMixin,
  authenticator: "authenticator:gloit-app"

  registerable: appConfig.registerable

  title: appConfig.title
  copyright: appConfig.copyright
  version: appConfig.version

  supportedBrowers: appConfig.supportedBrowers

`export default LoginController`
