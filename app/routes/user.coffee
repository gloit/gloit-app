`import Ember from 'ember'`
`import ModelEditMixin from '../mixins/route/model/edit'`

UserRoute = Ember.Route.extend ModelEditMixin,
  typeKey: 'user'
  typeHumanName: '用户'

`export default UserRoute`
