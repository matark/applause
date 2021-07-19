class InvitationsController < ApplicationController
  before_action :authenticate_user
  before_action :find_team

  def index
    render json: @team.pending_members
  end

  private

  def find_team
    @team = Team.find_by!(slug: params[:slug])
  end
end
