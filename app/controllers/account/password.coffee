`import Ember from 'ember'`

PasswordController = Ember.ObjectController.extend Ember.Validations.Mixin,
  actions:
    save: ->
      @send('loading')
      @get('model').changePassword(
        @get('oldPassword'),
        @get('newPassword'),
        @get('newPasswordConfirmation')
      ).then( =>
        Notifier.success('修改密码成功')
        @setProperties(oldPassword: null, newPassword: null, newPasswordConfirmation: null)
      , (errorMsg) ->
        Notifier.error(errorMsg)
      ).finally => @send('finished')

    revertChanges: ->
      @setProperties(oldPassword: null, newPassword: null, newPasswordConfirmation: null)

PasswordController.reopen
  validations:
    oldPassword:
      presence: true
    newPassword:
      presence: true
      confirmation:
        message: '两次输入的密码不匹配'

`export default PasswordController`
