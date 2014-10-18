`import BaseMixin from './base'`

NewMixin = Ember.Mixin.create BaseMixin,
  model: -> @store.createRecord(@typeKey)

  formLegend: (->
    "添加#{@get('typeHumanName')}"
  ).property('typeHumanName')

`export default NewMixin`
