class TeamController < ApplicationController

  before_action :authenticate_user!, unless: :api_request?

  def index
    @teams = current_user.teams
  end

  def show
    Player.injury_update
    @team = Team.find_by_id(params[:id])
    @players = @team.players
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.new create_params
    if @team.save
      redirect_to @team, notice: "Your team was created, now add some players"
    else
      render :new
    end
  end

private

  def create_params
    params.require(:team).permit(:name)
  end

end
