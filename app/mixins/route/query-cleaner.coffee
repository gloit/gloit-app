QueryCleanerMixin = Ember.Mixin.create
  setupController: (controller, model) ->
    controller.set('query', {}) if controller.get('query')

    @_super(controller, model)

`export default QueryCleanerMixin`
