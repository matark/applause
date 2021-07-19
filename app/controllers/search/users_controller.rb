class Search::UsersController < ApplicationController
  def index
    render json: User.none
  end
end
