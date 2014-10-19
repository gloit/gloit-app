`import BaseMixin from './base'`

EditMixin = Ember.Mixin.create BaseMixin,
  model: (params) -> @store.find(@typeKey, params["#{@typeKey.underscore()}_id"])

  formLegend: (->
    "编辑#{@get('typeHumanName')}"
  ).property('typeHumanName')

`export default EditMixin`
