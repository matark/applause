class SessionsController < ApplicationController
  rate_limit 'login/ip'

  def create
    return head :bad_request if params[:code].blank?
    return head :bad_gateway if google_params.blank?

    service = GoogleSessionService.new(google_params)
    session[:user_id] = service.user.id

    if service.user.new_record?
      service.execute
      head :created
    else
      head :ok
    end
  end

  private

  def google_params
    @_google_params ||= begin
      google_session.get_userinfo.tap do |user|
        user[:username] = Nanoid.generate
      end
    rescue
    end
  end

  def google_session
    @_google_session ||= Google::OAuth2.get_session(params[:code])
  end
end
