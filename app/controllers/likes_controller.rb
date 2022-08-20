class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    author = @like.post.author

    if @like.save
      redirect_to user_post_path(user_id: author.id, id: @like.post.id)
    else
      redirect_to user_post_path(user_id: author.id, id: @like.post.id),
                  alert: @like.errors.full_messages.first
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy
    redirect_to user_post_path(user_id: post.author.id, id: post.id)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
