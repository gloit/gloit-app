UserRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: (params) -> @store.find('user', params.user_id)

  setupController: (controller, model) ->
    controller.set('formLegend', '编辑用户')

    @_super(controller, model)

  actions:
    willTransition: ->
      @get('controller').send('revertChanges')

`export default UserRoute`
