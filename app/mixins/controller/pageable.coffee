`import Ember from 'ember'`

PageableMixin = Ember.Mixin.create
  isPageable: true
  total: 0
  pageSize: 20
  currentPage: 0
  windowSize: 9

  startPage: (->
    currentPage = Ember.get('currentPage')
    totalPages = Ember.get('totalPages')

    return 1 if totalPages <= @windowSize

    startPage = if currentPage - Math.floor((@windowSize / 2)) > 1 then currentPage - Math.floor((@windowSize / 2)) else 1
    startPage = totalPages - @windowSize + 1 if startPage + (@windowSize - 1) >= totalPages

    startPage
  ).property('currentPage')

  totalPages: (->
    Math.ceil(Ember.get('total') / Ember.get('pageSize')) || 0
  ).property('total', 'pageSize')

  actions:
    page: (page) -> @set('currentPage', page)

 `export default PageableMixin`
