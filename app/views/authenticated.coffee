`import Ember from 'ember'`

AuthenticatedView = Ember.View.extend
  classNames: 'ga-authenticated'

  didInsertElement: ->
    height = @$('.ga-content').height() - 60
    @$('.ga-content').height(height)

`export default AuthenticatedView`
