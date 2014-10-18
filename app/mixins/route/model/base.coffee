`import Ember from 'ember'`

BaseMixin = Ember.Mixin.create
  typeKey: undefined

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('formLegend', @get('formLegend')) if @get('formLegend')

  actions:
    willTransition: ->
      @get('controller').send('revertChanges')

`export default BaseMixin`
