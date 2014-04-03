Comments = new Meteor.Collection('comments');

Meteor.methods({
    comment: function(commentAttributes) {
        var user = Meteor.user();
        var post = Posts.findOne(commentAttributes.postId);
        // ensure the user is logged in
        if (!user)
            throw new Meteor.Error(401, 'Necesita iniciar sesion para comentar');
        if (!commentAttributes.body)
            throw new Meteor.Error(422, 'Por favor escriba un comentario');
        if (!post)
            throw new Meteor.Error(422, 'Debe comentar en un post');
        comment = _.extend(_.pick(commentAttributes, 'postId', 'body'), {
            userId: user._id,
            author: user.username,
            submitted: new Date().getTime()
        });
        // update the post with the number of comments
        Posts.update(comment.postId, {$inc: {commentsCount: 1}});
        return Comments.insert(comment);
    }
});