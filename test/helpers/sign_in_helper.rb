unless Object.const_defined?(:LoginController)
  class LoginController < ApplicationController
    def create
      session[:user_id] = params[:user_id]
    end
  end
end

module SignInHelper
  extend ActiveSupport::Concern

  included do
    setup do
      app.routes.send(:eval_block, Proc.new {
        post '/login', to: LoginController.action(:create)
      })
    end

    teardown do
      app.reload_routes!
    end
  end

  def sign_in(user)
    post login_url, { params: { user_id: user.id } }
  end
end
