class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    post = Post.find(params[:post_id])
    comment.post_id = post.id
    if comment.save
      redirect_to user_post_path(user_id: post.author.id, id: params[:post_id])
    else
      redirect_to user_post_path(user_id: post.author.id, id: params[:post_id]),
                  alert: comment.errors.full_messages.first
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
