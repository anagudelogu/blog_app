class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    post = comment.post

    flash[:alert] = comment.errors.full_messages.to_sentence.first unless comment.save

    redirect_to user_post_path(post.author, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
