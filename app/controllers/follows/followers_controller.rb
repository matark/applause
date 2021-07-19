class Follows::FollowersController < ApplicationController
  before_action :find_user

  def index
    render json: @user.user_followers
  end

  private

  def find_user
    @user = User.find_by!(username: params[:username])
  end
end
