class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = Post.where(author: @author).order(created_at: :desc)
  end

  def show
    @post = Post.where(user_id: params[:user_id]).find(params[:id])
  end
end
