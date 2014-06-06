helper = Ember.Handlebars.makeBoundHelper (value, options) ->
  return '' unless value

  format = options.hash['format'] || "YYYY-MM-DD HH:mm:ss"
  new Handlebars.SafeString(moment(value).format(format))

`export default helper`
