Template.postItem.helpers
  ownPost: ->
    return this.userId == Meteor.userId()

  domain: ->
    a = document.createElement('a')
    a.href = this.url
    return a.hostname
  upvotedClass: () ->
    userId = Meteor.userId()
    if (userId && !_.include(this.upvoters, userId))
      return 'btn-primary upvotable'
    else
      return 'disabled'
Template.postItem.events
  'click .upvote': (e) ->
    e.preventDefault()
    Meteor.call 'upvote', this._id

  'click .upvotable': (e) ->
    e.preventDefault()
    Meteor.call 'upvote', this._id