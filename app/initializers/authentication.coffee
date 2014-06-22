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

    Ember.SimpleAuth.Authenticators.Devise.reopen
      serverTokenEndpoint: "#{GloitAppENV.APP.api.host}/users/sign_in"
      authenticate: (credentials) ->
        new Ember.RSVP.Promise (resolve, reject) =>
          data = {}
          data[@resourceName] =
            login:    credentials.identification,
            password: credentials.password

          self = @
          @makeRequest(data).then (response) ->
            Ember.run -> resolve(self._extractResponse(response))
          , (xhr, status, error) ->
            Ember.run -> reject(xhr.responseJSON || xhr.responseText)

      _extractResponse: (response) ->
        Ember.merge(response.user, user_token: response.user.authentication_token, user_email: response.user.email)

    Ember.SimpleAuth.Authorizers.Devise.reopen
     authorize: (jqXHR, requestOptions) ->
       userToken = this.get('session.user_token')
       userEmail = this.get('session.user_email')
       if @get('session.isAuthenticated') && !Ember.isEmpty(userToken) && !Ember.isEmpty(userEmail)
         jqXHR.setRequestHeader('X-User-Token', userToken)
         jqXHR.setRequestHeader('X-User-Email', userEmail)

    Ember.SimpleAuth.setup(container, application, {
      authorizerFactory: 'ember-simple-auth-authorizer:devise'
      routeAfterAuthentication: 'authenticated'
      crossOriginWhitelist: ["#{GloitAppENV.APP.api.host}"]
    })

`export default authentication`
