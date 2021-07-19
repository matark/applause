class PingController < ApplicationController
  def index
    render plain: 'PONG'
  end
end
