class TeamController < ApplicationController

  before_action :authenticate_user!, unless: :api_request?

  def index
    @teams = current_user.teams
  end

  def show
    @id = params[:id]
     # @players = current_team.players
    # @players.each { |player| player.injury_update }
    # render :show
  end

end
