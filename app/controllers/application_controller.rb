class ApplicationController < ActionController::API
  include Rails.application.routes.url_helpers
  include ActionPolicy::Controller
  include Knock::Authenticable
  include Knock::RateLimit

  authorize :user, through: 'current_user'

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: exception.record.errors, status: 422
  end

  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end

  rescue_from ActionPolicy::Unauthorized do
    head :forbidden
  end
end
