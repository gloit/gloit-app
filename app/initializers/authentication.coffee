authentication =
  name: 'authentication'
  initialize: (container, application) ->
    Ember.SimpleAuth.Session.reopen
      currentUser: (->
        @get('container').lookup('store:main').push('user', @get('content'))
      ).property('content.id')

    Ember.SimpleAuth.setup(container, application)

`export default authentication`
