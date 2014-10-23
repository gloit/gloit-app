`import Ember from 'ember'`

SearchableIndexRouteMixin = Ember.Mixin.create
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.send('search')

`export default SearchableIndexRouteMixin`
