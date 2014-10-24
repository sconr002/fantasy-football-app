class Player < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :name

  include HTTParty

  def self.injury_update
    response = HTTParty.get("http://www.fantasyfootballnerd.com/service/injuries/json/#{ENV["FF_KEY"]}/")
    @injured = []
    #uses the API to populate @injured with the names of players injured that week
    response['Injuries'].each do |key, value|
      value.each do |injury|
        @injured << injury['playerName']
      end
    end
    #changes the player to injured true if they are hurt
    Player.all.each do |player|
      if @injured.include?(player.name)
        player.injured = true
        player.save!
      end
    end
  end

end
