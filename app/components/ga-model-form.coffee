`import Ember from 'ember'`

ModelFormComponent = Ember.Component.extend
  classNames: ['ga-model-form']

  typeKey: undefined
  typeHumanName: undefined
  model: undefined

  indexRoute: (->
    @get('typeKey').pluralize()
  ).property('typeKey')

  removeConfirmationName: (->
    "remove#{@typeKey.capitalize()}Confirmation"
  ).property('typeKey')
  removeConfirmationTitle: '确认删除'
  removeConfirmationMessage: (->
    "您确认需要删除该#{@typeHumanName}吗？"
  ).property('typeHumanName')
  removeConfirmationButtons: [
    Ember.Object.create title: '确认', clicked: "confirmRemove"
    Ember.Object.create title: '取消', dismiss: 'modal'
  ]

  save: 'save'
  cancel: 'cancel'
  remove: 'remove'
  confirmRemove: 'confirmRemove'
  revertChanges: 'revertChanges'

  actions:
    save: -> @sendAction('save')
    cancel: -> @sendAction('cancel')
    remove: -> @sendAction('remove')
    confirmRemove: -> @sendAction('confirmRemove')
    revertChanges: -> @sendAction('revertChanges')

`export default ModelFormComponent`
