module Google
  module OAuth2
    class Session
      def initialize
        @strategy = build_strategy
      end

      def authorize_url(**args)
        @strategy.authorize_url(**args)
      end

      def get_token(code)
        @token ||= @strategy.get_token(code)
      end

      def get_userinfo
        response = @token.get('/oauth2/v3/userinfo')
        JSON.parse(response.body, { symbolize_names: true })
      end

      private

      def build_strategy
        ::OAuth2::Client.new(OAuth2.client_id, OAuth2.client_secret, **OAuth2.default_options).auth_code
      end
    end
  end
end
