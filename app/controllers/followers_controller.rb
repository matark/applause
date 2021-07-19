class FollowersController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.user_followers
  end
end
