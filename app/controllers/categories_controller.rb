class CategoriesController < ApplicationController
  def index
    render json: Category.last(12)
  end

  def show
    render json: Category.find_by!(slug: params[:slug])
  end
end
