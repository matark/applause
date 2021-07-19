class FollowingController < ApplicationController
  before_action :authenticate_user
  before_action :find_user

  def index
    render json: current_user.following_users
  end

  def show
    if current_user.following?(@user)
      head :no_content
    else
      head :not_found
    end
  end

  def update
    current_user.follow(@user)
  end

  def destroy
    current_user.stop_following(@user)
  end

  private

  def find_user
    @user = User.find_by!(username: params[:username])
  end
end
