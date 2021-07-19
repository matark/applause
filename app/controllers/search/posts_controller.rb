class Search::PostsController < ApplicationController
  def index
    if params[:q].blank?
      render json: Post.none
    else
      render json: Post.search(params[:q]).take(5)
    end
  end
end
