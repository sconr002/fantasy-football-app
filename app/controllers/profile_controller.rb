class ProfileController < ApplicationController

  # before_action :authenticate_user!

  def index
    #manually setting the team here
    @players = current_user.teams.find_by_id(1).players
    @players.each { |player| player.injury_update }
    render :index
  end

  def create
    #manually setting the team here
    @player = current_user.teams.find_by_id(1).players.new player_params
    if @player.save
      render :show
    else
      render_invalid @player
    end
  end

private

  def player_params
    params.require(:player).permit(:name, :pos, :nfl_team)
  end

end
