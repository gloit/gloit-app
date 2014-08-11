`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

ApplicationRoute = Ember.Route.extend ApplicationRouteMixin,
  actions:
    loading: ->
      controller = @controllerFor('application')
      controller.set('loading', true)
      @router.one 'didTransition', ->
        controller.set('loading', false)

    finished: ->
      @controllerFor('application').set('loading', false)

`export default ApplicationRoute`
