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
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to :user_posts, notice: 'Post Succesfully Created!'
    else
      redirect_to :new_user_post, alert: post.errors.full_messages.first
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
