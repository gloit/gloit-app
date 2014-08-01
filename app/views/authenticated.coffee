`import Ember from 'ember'`

AuthenticatedView = Ember.View.extend
  didInsertElement: ->
    height = @$('.gloit-content').height() - 60
    @$('.gloit-content').height(height)

`export default AuthenticatedView`
