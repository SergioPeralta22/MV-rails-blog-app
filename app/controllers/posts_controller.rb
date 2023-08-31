class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.includes(:posts, posts: [:comments]).find_by(id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    post = Post.find(id: params[:id])
    if post.destroy
      flash[:success] = 'The post was deleted'
      post.decrement_posts_counter
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Could not delete post, try again'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
