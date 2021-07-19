class Follows::FollowingController < ApplicationController
  before_action :find_person, only: [:show]
  before_action :find_user

  def index
    render json: @user.following_users
  end

  def show
    if @user.following?(@person)
      head :no_content
    else
      head :not_found
    end
  end

  private

  def find_user
    @user = User.find_by!(username: params[:username])
  end

  def find_person
    @person = User.find_by!(username: params[:x_username])
  end
end
