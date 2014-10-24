class NflPlayer < ActiveRecord::Base
  validates_presence_of :name, :pos, :team

  include HTTParty

  def self.populate_db
    response = HTTParty.get('http://www.fantasyfootballnerd.com/service/players/json/u7djwgevx9me/')
    response['Players'].each do |player|
      new_player = NflPlayer.new(name: player['displayName'],pos: player['position'],team: player['team'])
      new_player.save!
    end
  end

end
