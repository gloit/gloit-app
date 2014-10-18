`import Ember from 'ember'`

ModelRoute = Ember.Route.extend
  typeKey: undefined
  formLegend: undefined

  model: (params) -> @store.find(@typeKey, params["#{@typeKey}_id"])

  setupController: (controller, model) ->
    controller.set('formLegend', @formLegend) if @formLegend

    @_super(controller, model)

  actions:
    willTransition: ->
      @get('controller').send('revertChanges')

`export default ModelRoute`
