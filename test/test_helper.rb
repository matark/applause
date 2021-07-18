ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

Shoulda::Matchers.configure do |config|
  config.integrate do |integration|
    integration.test_framework :minitest
    integration.library :rails
  end
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  parallelize :workers => :number_of_processors
end
