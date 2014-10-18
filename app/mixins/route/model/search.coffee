`import Ember from 'ember'`

SearchMixin = Ember.Mixin.create
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.send('search')

`export default SearchMixin`
