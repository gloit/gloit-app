authentication =
  name: 'authentication'
  initialize: (container, application) ->
    # Clear session data
    currentURL = localStorage.getItem('gloit-app:current-url')
    lastPageLoadedAt = new Date(localStorage.getItem('gloit-app:last-page-loaded-at'))

    now = new Date()
    if window.location.href.indexOf(currentURL) < 0 || now - lastPageLoadedAt > 20 * 60 * 1000
      localStorage.clear()

    localStorage.setItem('gloit-app:last-page-loaded-at', now)

    Ember.SimpleAuth.Session.reopen
      currentUser: (->
        @get('container').lookup('store:main').push('user', @get('content'))
      ).property('content.id')

    Ember.SimpleAuth.setup(container, application, {
      routeAfterAuthentication: 'authenticated'
    })

`export default authentication`
