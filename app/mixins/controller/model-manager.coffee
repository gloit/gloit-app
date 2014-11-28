`import Ember from 'ember'`

ModelManagerMixin = Ember.Mixin.create
  # TODO
  # Remove
  modelName: Ember.computed.alias('typeKey')
  # TODO
  # Remove
  humanModelName: Ember.computed.alias('typeHumanName')

  typeKey: undefined
  typeHumanName: undefined

  afterSaveRoute: (-> @get('typeKey').dasherize()).property('typeKey')
  afterCancelRoute: (-> @get('typeKey').dasherize().pluralize()).property('typeKey')
  afterDestroyRoute: (-> @get('typeKey').dasherize().pluralize()).property('typeKey')

  removeConfirmationName: (->
    "remove#{@get('typeKey').capitalize()}Name"
  ).property('typeKey')

  # TODO
  # Remove
  removeConfirmationTitle: '确认删除'
  # TODO
  # Remove
  removeConfirmationMessage: (->
    "您确认需要删除该#{@get('typeHumanName')}吗？"
  ).property('typeHumanName')
  # TODO
  # Remove
  removeConfirmationButtons: [
    Ember.Object.create title: '确认', clicked: "confirmRemove"
    Ember.Object.create title: '取消', dismiss: 'modal'
  ]

  beforeSave: Ember.K
  afterSave: Ember.K

  # @deprecated
  beforeConfirmRemove: ->
    Ember.deprecate('`ModelManager#beforeConfirmRemove` is droped, please use `ModelManager#beforeRemove` instead.')
    true

  beforeRemove: Ember.K
  afterRemove: Ember.K

  actions:
    revertChanges: ->
      @get('model').rollback() if @get('model.isDirty')

    save: ->
      return unless @beforeSave()

      saved = =>
        Notifier.success("保存#{@get('typeHumanName')}成功")
        @afterSave()
        @transitionToRoute(@get('afterSaveRoute'), @get('model'))

      saveFailed = =>
        Notifier.error("保存#{@get('typeHumanName')}失败")

      @send('loading')
      @get('model').save().then(saved, saveFailed).finally( => @send('finished') )

    cancel: ->
      @get('model').rollback()
      @transitionToRoute(@get('afterCancelRoute'))

    remove: ->
      Bootstrap.ModalManager.show @get('removeConfirmationName')

    confirmRemove: ->
      Bootstrap.ModalManager.hide @get('removeConfirmationName')

      # TODO Remove `@beforeConfirmRemove()`
      return false unless @beforeConfirmRemove() && @beforeRemove()

      removed = =>
        Notifier.success("删除#{@get('typeHumanName')}成功")
        @afterRemove()
        @transitionToRoute(@get('afterDestroyRoute'))

      removeFailed = (response) =>
        @get('model').rollback()

        if response.errors
          Notifier.error response.errors.msg
        else
          Notifier.error("删除#{@get('typeHumanName')}失败")

      @send('loading')
      @get('model').deleteRecord()
      @get('model').save().then(removed, removeFailed).finally( => @send('finished') )

`export default ModelManagerMixin`
