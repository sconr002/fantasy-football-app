class ProfileController < ApplicationController

  # before_action :authenticate_user!

  def index
    @players = current_user.teams.find_by_id(1).players
    @players.each { |player| player.injury_update }
    render :index
  end

end
