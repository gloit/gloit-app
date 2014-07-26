`import Ember from 'ember'`

helper = Ember.Handlebars.makeBoundHelper (value, options) ->
  return '' unless value

  format = options.hash['format'] || "YYYY-MM-DD HH:mm:ss"
  new moment(value).format(format).htmlSafe()

`export default helper`
