class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user_to_follow = User.find(params[:id])
    current_user.follow(user_to_follow)
    redirect_back(fallback_location: root_path, notice: "You are now following #{user_to_follow.email}")
  end

  def destroy
    user_to_unfollow = User.find(params[:id])
    current_user.unfollow(user_to_unfollow)
    redirect_back(fallback_location: root_path, notice: "You have unfollowed #{user_to_unfollow.email}")
  end
end
