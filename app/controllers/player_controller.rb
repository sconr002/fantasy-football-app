class PlayerController < ApplicationController

  before_action :authenticate_user!, unless: :api_request?

  def new
    @player = Player.new
  end

  def create
    @current_team = current_team
    @player = @team.players new player_create_params
    if @player.save
      redirect_to @player, notice: "Player added!"
    else
      render_invalid @player
    end
  end

private

  def player_create_params
    params.require(:player).permit(:name, :pos, :nfl_team)
  end

  def current_team
    @current_team = Team.find_by_id(params[:id])
  end

end
