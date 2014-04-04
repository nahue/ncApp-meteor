Meteor.publish 'posts', (options) ->
  return Posts.find({}, options)

Meteor.publish 'singlePost', (id) ->
  return id && Posts.find id

Meteor.publish 'comments', (postId) ->
  return Comments.find {postId: postId}


Meteor.publish 'notifications', () ->
  return Notifications.find {userId: this.userId}
