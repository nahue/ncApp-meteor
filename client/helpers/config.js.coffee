Meteor.startup ->
  AccountsEntry.config
    homeRoute: '/'
    dashboardRoute: '/'
    passwordSignupFields: 'USERNAME_AND_OPTIONAL_EMAIL'