@Notifications = new Meteor.Collection 'notifications'

Notifications.allow
  update: ownsDocument

@createCommentNotification = (comment) ->
  post = Posts.findOne comment.postId
  console.log comment
  console.log post
  if (comment.userId != post.userId )
    Notifications.insert
      userId: post.userId
      postId: post._id
      commentId: comment._id
      commenterName: comment.author
      read: false

