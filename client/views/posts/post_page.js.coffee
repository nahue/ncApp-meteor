Template.postPage.helpers
  domain: ->
    a = document.createElement('a')
    a.href = this.url
    return a.hostname
  comments: ->
    return Comments.find({postId: this._id})
  upvotedClass: () ->
    userId = Meteor.userId()
    if (userId && !_.include(this.upvoters, userId))
      return 'upvotable'
    else
      return 'disabled'

Template.postPage.events
  'click .upvote': (e) ->
    e.preventDefault()
    Meteor.call 'upvote', this._id

  'click .upvotable': (e) ->
    e.preventDefault()
    Meteor.call 'upvote', this._id