class PlayerController < ApplicationController

  before_action :authenticate_user!, unless: :api_request?

  def new
    @player = Player.new
    @team = Team.find_by_id(params[:team_id])
  end

  def create
    @player = Player.new player_create_params
    if @player.save
      @team = Team.find_by_id(params[:player][:team_id])
    else
      render_invalid @player
    end
  end

  def destroy
    binding.pry
  end

private

  def player_create_params
    params.require(:player).permit(:name, :pos, :nfl_team, :team_id)
  end

end
