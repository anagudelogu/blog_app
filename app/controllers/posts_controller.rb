class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts.order(id: :desc).includes(:author)
  end

  def show
    @comments = @post.comments.order(id: :desc).includes(:author)
  end

  def new; end

  def create
    @post.user_id = params[:user_id]
    if @post.save
      redirect_to :user_posts, notice: 'Post Succesfully Created!'
    else
      redirect_to :new_user_post, alert: @post.errors.full_messages.to_sentence
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(user_id: params[:user_id]), notice: 'Post deleted'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
