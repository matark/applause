class UsersController < ApplicationController
  def index
    render json: User.page(params[:page])
  end

  def show
    render json: User.find_by!(username: params[:username])
  end
end
