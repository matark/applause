class TeamsController < ApplicationController
  before_action :authenticate_user
  before_action :find_team, except: [:index, :create]

  def index
    render json: current_user.teams.page(params[:page])
  end

  def create
    @team = current_user.teams.create!(team_params)
    head :created, location: team_path(@team.slug)
  end

  def show
    authorize! @team
    render json: @team
  end

  def update
    authorize! @team
    @team.update!(team_params)
  end

  def destroy
    authorize! @team
    @team.destroy
  end

  private

  def find_team
    @team = Team.find_by!(slug: params[:slug])
  end

  def team_params
    params.permit(:name, :slug, :description)
  end
end
