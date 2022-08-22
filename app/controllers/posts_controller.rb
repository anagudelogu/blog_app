class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to :user_posts, notice: 'Post Succesfully Created!'
    else
      redirect_to :new_user_post, alert: post.errors.full_messages.to_sentence
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
