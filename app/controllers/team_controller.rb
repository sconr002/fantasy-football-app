class TeamController < ApplicationController

  before_action :authenticate_user!, unless: :api_request?

  def show
    @players = current_team.players
    @players.each { |player| player.injury_update }
    render :show
  end

end
