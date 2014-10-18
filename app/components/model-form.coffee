`import Ember from 'ember'`

ModelFormComponent = Ember.Component.extend
  typeKey: undefined
  typeHumanName: undefined
  model: undefined

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
  return: 'return'

  actions:
    save: -> @sendAction('save')
    cancel: -> @sendAction('cancel')
    remove: -> @sendAction('remove')
    confirmRemove: -> @sendAction('confirmRemove')
    revertChanges: -> @sendAction('revertChanges')
    return: -> @sendAction('return')

`export default ModelFormComponent`
