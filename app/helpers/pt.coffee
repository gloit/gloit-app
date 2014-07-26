`import Ember from 'ember'`

pt = (propName, options) ->
  key = if scope = options.hash.scope then "#{scope}.#{propName}" else propName
  Ember.I18n.t(key)

`export default pt`
