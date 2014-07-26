`import Ember from 'ember'`

UsersController = Ember.ArrayController.extend
  toolbarLinks: [
    { text: '添加用户', route: 'users.new', icon: 'fa fa-plus' }
  ]

`export default UsersController`
