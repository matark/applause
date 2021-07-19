class NotificationsController < ApplicationController
  before_action :authenticate_user
  before_action :find_notification, only: [:update, :destroy]

  def index
    render json: current_user.notifications.page(params[:page])
  end

  def update
    @notification.toggle!(:unread) if @notification.unread?
  end

  def destroy
    @notification.destroy
  end

  private

  def find_notification
    @notification = current_user.notifications.find(params[:id])
  end
end
