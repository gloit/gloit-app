var user = { id: 1, email: 'admin@gloit.cn', username: 'admin', realname: 'Admin', user_email: 'admin@gloit.cn', user_token: 'abcdefg', roles: 'admin' };
var users = [ user ];
var idOfLastUser = 1;

function getUserById(id) {
  for(var i = 0; i < users.length; i++) {
    if(users[i].id == id) return users[i];
  }
}

module.exports = function(app) {
  app.get('/users', function(req, res) {
    res.json({ users: users });
  });

  app.get('/users/:id', function(req, res) {
    res.json({ user: getUserById(req.params.id) })
  });

  app.post('/users', function(req, res) {
    var newUser = req.body.user;
    newUser.id = idOfLastUser + 1;
    users.push(newUser);
    idOfLastUser = idOfLastUser + 1;

    res.status(200).json({ user: newUser });
  });

  app.put('/users/:id', function(req, res) {
    var u = getUserById(req.params.id);
    for(key in req.body.user) {
      u[key] = req.body.user[key];
    }

    res.status(200).json({ user: u });
  });

  app.delete('/users/:id', function(req, res) {
    var u = getUserById(req.params.id);
    users.splice(users.indexOf(u), 1);

    res.status(200).json(null);
  });

  app.post('/users/:id/lock', function(req, res) {
    var u = getUserById(req.params.id);
    u.access_locked = true;

    res.status(200).json({ user: u });
  });

  app.post('/users/:id/unlock', function(req, res) {
    var u = getUserById(req.params.id);
    u.access_locked = false;

    res.status(200).json({ user: u });
  });

  app.post('/users/sign_in', function(req, res) {
    var params = req.body.user;
    if (params.email === 'admin' && params.password === '123456')
      res.status(200).json(user)
    else
      res.status(401).json(null)
  });

  app.put('/password', function(req, res) {
    var params = req.body.password;

    if (params.current_password === '123456' && params.password == params.password_confirmation)
      res.status(200).json({ msg: 'Password changed'});
    else
      res.status(422).json({ errors: 'Something is wrong' });
  });
};
