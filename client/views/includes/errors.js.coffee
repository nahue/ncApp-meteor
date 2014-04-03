Template.errors.helpers
  errors: ->
    return Errors.find()

Template.error.rendered = ->
  error = this.data
  Meteor.defer( ->
    Errors.update(error._id, {$set: {seen: true }})
  )
