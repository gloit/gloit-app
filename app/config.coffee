gloitAppConfig =
  brand: { name: 'GLOIT' }
  title: 'Gloit Application'
  copyright: '&copy; 2014'
  version: 'v0.3.0'

  supportedBrowers: [
    { name: 'Chrome', url: 'http://www.google.com/chrome', icon: '/images/chrome.png' }
    { name: 'Firefox', url: 'http://www.mozilla.org/en-US/firefox/new/', icon: '/images/firefox.png' }
    { name: 'Safari', url: 'http://www.apple.com/sg/safari/', icon: '/images/safari.png' }
    { name: 'IE 10+', url: 'http://windows.microsoft.com/en-sg/internet-explorer/ie-10-worldwide-languages', icon: '/images/ie.png' }
  ]

  sidebar:
    menus: [{
      icon: 'fa fa-gear', text: '系统管理', roles: ['admins']
      items: [
        { icon: 'fa fa-users', route: 'users', text: '用户管理', roles: ['admins'] }
      ]
    }]

    starterItems: [
      { icon: 'fa fa-user', route: 'account.profile', text: '个人信息' }
      { icon: 'fa fa-key', route: 'account.password', text: '修改密码' }
      { icon: 'fa fa-sign-out', route: 'logout', text: '注销' }
    ]

  availableRoles: [
    { label: '系统管理员', value: 'admins' }
    { label: '普通用户', value: 'users' }
  ]

`export default gloitAppConfig`
