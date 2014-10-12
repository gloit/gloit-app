`import Ember from 'ember'`
`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`
`import gloitAppConfig from '../config'`

LoginController  = Ember.Controller.extend LoginControllerMixin,
  authenticator: "authenticator:gloit-app"

  registerable: gloitAppConfig.registerable

  title: gloitAppConfig.title
  copyright: gloitAppConfig.copyright
  version: gloitAppConfig.version

  supportedBrowers: gloitAppConfig.supportedBrowers

`export default LoginController`
