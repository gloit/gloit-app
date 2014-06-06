helper = Ember.Handlebars.makeBoundHelper (value, options) ->
  return '' unless value
  new Handlebars.SafeString(moment(value).fromNow())

`export default helper`
