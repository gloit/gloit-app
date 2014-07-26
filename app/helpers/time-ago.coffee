`import Ember from 'ember'`

helper = Ember.Handlebars.makeBoundHelper (value) ->
  return '' unless value
  new moment(value).fromNow().htmlSafe()

`export default helper`
