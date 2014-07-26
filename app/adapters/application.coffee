`import DS from 'ember-data'`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: GloitAppENV.APP.api.host
  namespace: GloitAppENV.APP.api.namespace

`export default ApplicationAdapter`
