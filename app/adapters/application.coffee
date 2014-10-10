`import DS from 'ember-data'`
`import config from '../config/environment'`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: config.APP.api.host
  namespace: config.APP.api.namespace

`export default ApplicationAdapter`
