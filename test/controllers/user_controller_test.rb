require 'test_helper'
require 'helpers/sign_in_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  include SignInHelper

  context 'routes' do
    should route(:get, '/user').to(action: 'show')
    should route(:put, '/user').to(action: 'update')
  end

  context 'logged in' do
    setup do
      sign_in create(:user)
    end

    context 'GET :show' do
      should 'responds ok' do
        get '/user'
        assert_response :ok
      end
    end

    context 'PUT :show' do
      should 'responds no_content' do
        put '/user'
        assert_response :no_content
      end
    end
  end

  context 'logged out' do
    context 'GET :show' do
      should 'responds unauthorized' do
        get '/user'
        assert_response :unauthorized
      end
    end
  end
end
