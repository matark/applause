class UserController < ApplicationController
  before_action :authenticate_user

  def show
    render json: current_user
  end

  def update
    if params[:current_password].present?
      service = ChangePasswordService.new(params)
      service.execute(current_user)
    end

    head :no_content
  end

  private

  def user_params
    params.permit(:username, :name, :bio)
  end
end
