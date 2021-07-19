module Knock
  module Authenticable
    private

    def authenticate_user
      head :unauthorized if current_user.nil?
    end

    def current_user
      @_current_user ||= (session[:user_id] && User.find(session[:user_id]))
    end

    def auth_token
      token_from_request_headers or params[:token]
    end

    def token_from_request_headers
      request.get_header('HTTP_AUTHORIZATION')&.split&.last
    end
  end
end
