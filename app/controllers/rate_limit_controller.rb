class RateLimitController < ApplicationController
  def index
    render json: throttle_data
  end
end
