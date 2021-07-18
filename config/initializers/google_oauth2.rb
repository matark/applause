require 'google/oauth2'
require 'google/oauth2/session'

Google::OAuth2.configure do |config|
  config.client_id     = ENV['GOOGLE_CLIENT_ID']
  config.client_secret = ENV['GOOGLE_CLIENT_SECRET']
  config.redirect_uri  = ENV['GOOGLE_REDIRECT_URI']
end
