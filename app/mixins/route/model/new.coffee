`import BaseMixin from './base'`

NewMixin = Ember.Mixin.create BaseMixin,
  controllerName: Ember.computed.alias('typeKey')

  model: -> @store.createRecord(@typeKey)

  formLegend: (->
    "添加#{@get('typeHumanName')}"
  ).property('typeHumanName')

`export default NewMixin`
