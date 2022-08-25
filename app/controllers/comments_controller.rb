class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    post = @comment.post

    flash[:alert] = @comment.errors.full_messages.to_sentence unless @comment.save

    redirect_to user_post_path(post.author, post)
  end

  def destroy
    post= @comment.post
    @comment.destroy
    redirect_to user_post_path(post.author, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
