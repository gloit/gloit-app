`import Ember from 'ember'`
`import config from '../../config/environment'`

NewController = Ember.ObjectController.extend
  username: null
  realname: null
  email: null
  password: null
  passwordConfirmation: null

  actions:
    save: ->
      Ember.$.ajax(
        url: "#{config.APP.api.baseUrl}/users"
        type: 'POST'
        data:
          user:
            username: @get('username')
            realname: @get('realname')
            email: @get('email')
            password: @get('password')
            password_confirmation: @get('passwordConfirmation')
            roles: 'user'
        dataType: 'json'
      ).then =>
        @transitionToRoute 'registrations.success'
      , -> Notifier.error '用户注册失败'

    cancel: -> @transitionToRoute('login')

`export default NewController`
