class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = Post.where(author: @author).order(created_at: :desc)
  end

  def show
    @post = Post.where(user_id: params[:user_id]).find(params[:id])
    @current_user = current_user
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @current_user = current_user
    post = Post.new(post_params)
    if post.save
      redirect_to :user_posts, notice: 'Post Succesfully Created!'
    else
      redirect_to :new_user_post, alert: post.errors.full_messages.first
    end
  end

  private

  def post_params
    author = current_user
    hash = params.require(:post).permit(:title, :text)
    hash[:author] = author
    hash
  end
end
