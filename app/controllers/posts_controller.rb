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

  def create
    post = Post.new(post_params)
    if post.save
      flash[:notice] = ['Post Succesfully Created!']
      redirect_to :user_posts
    else
      flash[:alert] = post.errors.full_messages
      redirect_to :new_user_post
    end
  end

  private

  def post_params
    author = User.find(params[:user_id])
    hash = params.require(:post).permit(:title, :text)
    hash[:author] = author
    hash
  end
end
