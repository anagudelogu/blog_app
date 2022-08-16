class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = Post.where(author: @author).order(created_at: :desc)
  end

  def show
    @post_id = params[:id]
    @user_id = params[:user_id]
  end
end
