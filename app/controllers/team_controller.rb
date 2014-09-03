class TeamController < ApplicationController

  # before_action :authenticate_user!

  def show
    @players = current_team.players
    @players.each { |player| player.injury_update }
    render :show
  end

private

  def current_team
    current_user.teams.find_by_name(params[:team])
  end

end
