`import Ember from 'ember'`

`import PageableMixin from './pageable'`

SearchableMixin = Ember.Mixin.create PageableMixin,
  searchResultProperty: 'model'
  selectedResult: new Ember.Set()

  query: {}

  typeKey: undefined

  # TODO
  # Remove
  keyForModel: Ember.computed.alias('typeKey')

  paginate: (->
    @setDefaultQuery()
    @_search()
  ).observes('currentPage')

  defaultQuery: {}
  setDefaultQuery: ->
    @_setQuery(k, v) for k, v of @get('defaultQuery')

  actions:
    search: ->
      @set 'currentPage', 1
      @setDefaultQuery()
      @_search()

  _setQuery: (name, value) ->
    if Ember.isEmpty(value)
      delete @get('query')[name]
    else
      @set("query.#{name}", value)

  _search: ->
    if @get('typeKey')
      @send('loading')
      @get('store').find(@get('typeKey'), q: @get('query'), page: @get('currentPage'), limit: @get('pageSize')).then (records) =>
        @send('finished')
        @set('total', records.meta.total)
        @set(@get('searchResultProperty'), records)
    else
      Ember.Logger.error 'You should specify the key of the model which will be searched.'

`export default SearchableMixin`
