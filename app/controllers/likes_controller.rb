class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:id])
    current_user.like(post)
    redirect_back(fallback_location: root_path, notice: "You liked this post")
  end

  def destroy
    post = Post.find(params[:id])
    current_user.unlike(post)
    redirect_back(fallback_location: root_path, notice: "You unliked this post")
  end
end
