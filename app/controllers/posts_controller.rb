class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = Post.where(author: @author).order(created_at: :desc)
    @current_user = current_user
  end

  def show
    @post = Post.where(user_id: params[:user_id]).find(params[:id])
  end

  def new
    @post = Post.new
    @current_user = current_user
  end
end
