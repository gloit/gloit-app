`import Ember from 'ember'`
`import ModelNewMixin from '../../mixins/route/model/new'`

NewRoute = Ember.Route.extend ModelNewMixin,
  typeKey: 'user'
  typeHumanName: '用户'

  controllerName: 'user'

`export default NewRoute`
