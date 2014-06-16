User = DS.Model.extend
  username: DS.attr()
  realname: DS.attr()
  email: DS.attr()
  password: DS.attr()
  roles: DS.attr()
  accessLocked: DS.attr('boolean')

  name: Ember.computed.any('realname', 'username')
  lockable: Ember.computed.not('accessLocked')
  unlockable: Ember.computed.alias('accessLocked')

  changePassword: (oldPwd, newPwd, pwdConfirmation) ->
    new Ember.RSVP.Promise (resolve, reject) =>
      return reject('您两次输入的新密码不匹配') if newPwd != pwdConfirmation

      $.ajax(
        url: "#{GloitAppENV.APP.api.baseUrl}/password"
        type: "PUT"
        data:
          password:
            current_password: oldPwd
            password: newPwd
            password_confirmation: pwdConfirmation
        dataType: 'json'
      ).then ->
        resolve()
      , (jqXHR, textStatus, errorThrown) ->
        reject(jqXHR.responseJSON.errors.password)

  lock: ->
    $.post("#{GloitAppENV.APP.api.baseUrl}/users/#{@get('id')}/lock").then (user) =>
      @get('store').pushPayload('user', user)

  unlock: ->
    $.post("#{GloitAppENV.APP.api.baseUrl}/users/#{@get('id')}/unlock").then (user) =>
      @get('store').pushPayload('user', user)

  hasRole: (roles, matchMode) ->
    return false unless roles

    roles = [roles] if typeof(roles) == 'string'

    match = false
    if matchMode == 'any'
      roles.forEach (role) =>
        if @get('roles') && @get('roles').split(', ').contains(role)
          match = true
          return false
    else
      roles.forEach (role) =>
        if !@get('roles') || !@get('roles').split(', ').contains(role)
          match = false
          return false

    match

`export default User`
