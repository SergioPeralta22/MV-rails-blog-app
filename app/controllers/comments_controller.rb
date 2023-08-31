class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.save
    redirect_to user_posts_path(current_user)
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    post = Post.find_by(id: comment.post_id)
    if comment.destroy
      post.decrement!(:comments_counter)
      flash[:success] = 'The comment was deleted'
    else
      flash[:error] = 'Could not delete comment, try again'
    end
    redirect_to user_post_url(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
