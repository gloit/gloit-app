ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: ENV.APP.api.host
  namespace: ENV.APP.api.namespace

`export default ApplicationAdapter`
