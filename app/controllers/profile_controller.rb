class ProfileController < ApplicationController

  before_action :authenticate_user!

  def index
    p = Player.new
    p.injured_players
  end

end
