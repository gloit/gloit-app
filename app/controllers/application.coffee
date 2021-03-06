`import Ember from 'ember'`
`import appConfig from '../config'`

ApplicationController = Ember.Controller.extend
  brand: appConfig.brand
  sidebar: appConfig.sidebar
  availableRoles: appConfig.availableRoles

  availableSidebar: (->
    menus = []
    user = @get('session.currentUser')

    @get('sidebar.menus').forEach (menu) ->
      if user.hasRole(menu.roles, 'any')
        newMenu = Ember.merge {}, menu
        menus.push newMenu

        items = []
        menu.items.forEach (item) ->
          items.push item if user.hasRole(item.roles, 'any')

        newMenu.items = items

    { menus: menus, starterItems: @get('sidebar.starterItems') }
  ).property().volatile()

  breadcrumbs: []

  actions:
    currentPathDidChange: ->
      @get('breadcrumbs').clear()

      routes = @container.lookup('router:main').get('router.currentHandlerInfos')
      return if Ember.isEmpty(routes)

      breadcrumbs = []
      routes.forEach (route) ->
        name = route.name
        return if name.indexOf('.index') != -1 || name == 'application' || name == 'authenticated'

        handler = route.handler
        breadcrumb = Ember.Object.create
          route: handler.routeName
          name: Ember.I18n.t("routes.#{handler.routeName}")
          model: null

        # Fixed issuses after upgraded to 1.4.0
        unless Ember.isEmpty(Ember.keys(route.params))
          context = handler.context
          breadcrumb.setProperties
            model: context
            name: context.get('name') || context.get('id')

        breadcrumbs.pushObject(breadcrumb)

      @set('breadcrumbs', breadcrumbs) unless Ember.isEmpty(breadcrumbs)

    triggerMenu: (menu) ->
      @transitionToRoute menu.items.get('firstObject.route')

`export default ApplicationController`
