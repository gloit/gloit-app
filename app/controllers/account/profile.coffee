ProfileController = Ember.ObjectController.extend
  actions:
    revertChanges: ->
      @get('model').rollback() if @get('model.isDirty')

    save: ->
      @get('model').save().then =>
        Notifier.success('修改账号信息成功')
      , -> Notifier.error('修改账号信息失败')

`export default ProfileController`
