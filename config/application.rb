require_relative 'setup'
require_relative 'frameworks'

Bundler.require(*Rails.groups)

module Applause
  class Application < Rails::Application
    config.load_defaults 6.1
    # config.time_zone = 'Central Time (US & Canada)'
    # config.eager_load_paths << Rails.root.join('extras')

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.x.jwt_secret = ENV['JWT_SECRET']

    config.middleware.use Rack::Deflater
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    console do
      config.console = Pry
    end
  end
end
