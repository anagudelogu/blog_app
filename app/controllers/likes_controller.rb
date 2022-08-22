class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    post = @like.post
    author = post.author

    flash[:alert] = @like.errors.full_messages.to_sentence unless @like.save

    redirect_to user_post_path(author, post)
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy
    redirect_to user_post_path(post.author, post)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
