module Google
  module OAuth2
    DEFAULT_OPTIONS = {
      :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
      :token_url     => 'https://oauth2.googleapis.com/token',
      :site          => 'https://www.googleapis.com'
    }

    include ActiveSupport::Configurable

    module_function

    def client_id;     config.client_id     end
    def client_secret; config.client_secret end

    def default_options
      DEFAULT_OPTIONS.merge({
        redirect_uri: config.redirect_uri
      })
    end

    def get_session(code)
      Session.new.tap do |session|
        session.get_token(code)
      end
    end
  end
end
