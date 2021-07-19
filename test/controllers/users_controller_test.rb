require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  context 'routes' do
    should route(:get, '/users').to(action: 'index')
    should route(:get, '/users/1').to(action: 'show', username: '1')
  end
end
