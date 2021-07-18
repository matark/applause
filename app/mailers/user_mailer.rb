class UserMailer < ApplicationMailer
  before_action :set_current_user
  default to: -> { user_email }

  def send_password_changed_email
  end

  def send_reset_password_email
  end

  def send_verify_account_email
  end

  private

  def set_current_user
    @user = params[:user]
  end

  def user_email
    @user.email
  end
end
