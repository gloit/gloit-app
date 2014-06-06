var user = { id: 1, email: 'admin@gloit.cn', username: 'admin', realname: 'Admin', user_email: 'admin@gloit.cn', user_token: 'abcdefg', roles: 'admin' };

module.exports = function(app) {
  //app.get('/users/:id', function(req, res) {
    //res.json({ user: user })
  //});

  app.put('/users/:id', function(req, res) {
    var params = req.body.user;

    // FIXME Should merge the params to the user
    res.status(200).json({ user: user });
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
