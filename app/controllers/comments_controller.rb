class CommentsController < ApplicationController
  def create
    user = current_user
    comment = Comment.new(post_params)
    if comment.save
      redirect_to user_post_path(user_id: user.id, id: params[:post_id])
    else
      redirect_to user_post_path(user_id: user.id, id: params[:post_id]), alert: comment.errors.full_messages.first
    end
  end

  private

  def post_params
    author = current_user
    post = Post.find(params[:post_id])
    hash = params.require(:comment).permit(:text)
    hash[:author] = author
    hash[:post] = post
    hash
  end
end
