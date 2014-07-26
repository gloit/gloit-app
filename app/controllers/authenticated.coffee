`import Ember from 'ember'`

AuthenticatedController = Ember.ObjectController.extend
  needs: 'application'

  brand: Ember.computed.alias('controllers.application.brand')
  breadcrumbs: Ember.computed.alias('controllers.application.breadcrumbs')
  sidebar: Ember.computed.alias('controllers.application.availableSidebar')
  availableRoles: Ember.computed.alias('controllers.application.availableRoles')

  actions:
    triggerMenu: (menu) ->
      @transitionToRoute menu.items.get('firstObject.route')

`export default AuthenticatedController`
