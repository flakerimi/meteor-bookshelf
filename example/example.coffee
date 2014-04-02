Meteor.startup( ->
  if Meteor.isServer
    pgConString = "postgres://localhost/austin"
  else pgConString = null

  # create a persistent connection with postgres to monitor notifications
  Mediator.initialize(pgConString)

  User.initialize()
  User.subscribe.all()
  User.subscribe.count()
)

if Meteor.isClient
  ###
  Meteor.setInterval ->
    User.meteorCollection.insert
      username: new Date()
  , 100
  ###