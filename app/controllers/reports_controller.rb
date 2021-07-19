class ReportsController < ApplicationController
  def index
    render json: Report.page(params[:page])
  end
end
