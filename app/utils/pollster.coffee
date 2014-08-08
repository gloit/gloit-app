`import Ember from 'ember'`

Pollster = Ember.Object.extend
  start: (model, timeout) ->
    @model = model
    @timer = setInterval(@onPoll.bind(@), timeout || 5000)

  stop: ->
    clearInterval(@timer) if @timer

  onPoll: -> @model.reload()

`export default Pollster`
