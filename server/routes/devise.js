module.exports = function(app) {
  app.post('/users/sign_in', function(req, res) {
    var params = req.body.user;
      if(params.email === 'admin' && params.password === '123456')
        res.status(200).json({ id: 1, email: 'admin@gloit.cn', username: 'admin', realname: 'Admin', user_email: 'admin@gloit.cn', user_token: 'abcdefg', roles: 'admin' })
      else
        res.status(401).json(null)
  });
};
