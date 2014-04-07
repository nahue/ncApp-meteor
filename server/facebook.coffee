isProdEnv = ->
  if (process.env.ROOT_URL == "http://localhost:3000")
    return false
  else
    return true

Meteor.startup ->
  if isProdEnv()
    Accounts.loginServiceConfiguration.remove
      service: "facebook"

    Accounts.loginServiceConfiguration.insert
      service: "facebook"
      appId: "224478171081199"
      secret: "b02aff920453c62275f5a4a2113df0b8"