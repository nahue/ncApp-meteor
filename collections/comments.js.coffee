@Comments = new Meteor.Collection 'comments'

Meteor.methods
    comment: (commentAttributes) ->
      user = Meteor.user()
      post = Posts.findOne(commentAttributes.postId)
      # ensure the user is logged in
      if (!user)
        throw new Meteor.Error(401, 'Necesita iniciar sesion para comentar')
      if (!commentAttributes.body)
        throw new Meteor.Error(422, 'Por favor escriba un comentario')
      if (!post)
        throw new Meteor.Error(422, 'Debe comentar en un post')
      comment = _.extend(_.pick(commentAttributes, 'postId', 'body'),
        userId: user._id
        author: user.username
        submitted: new Date().getTime()
      )
      # update the post with the number of comments
      Posts.update(comment.postId, {$inc: {commentsCount: 1}})
      #return Comments.insert(comment);
      # create the comment, save the id
      comment._id = Comments.insert(comment)

      # now create a notification, informing the user that there's been a comment
      createCommentNotification comment

      return comment._id