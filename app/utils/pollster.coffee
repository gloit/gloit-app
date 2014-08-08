`import Ember from 'ember'`

Pollster = Ember.Object.extend
  start: (model, timeout = 1000) ->
    @model = model
    @timer = setInterval(@onPoll.bind(@), timeout)

  stop: ->
    clearInterval(@timer) if @timer

  onPoll: -> @model.reload()

`export default Pollster`
