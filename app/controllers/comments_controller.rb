class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_back(fallback_location: root_path, notice: "Comment added!")
    else
      redirect_back(fallback_location: root_path, alert: "Error adding comment: #{@comment.errors.full_messages.join(', ')}")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_back(fallback_location: root_path, notice: "Comment deleted")
    else
      redirect_back(fallback_location: root_path, alert: "You can only delete your own comments")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
