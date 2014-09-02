class Player < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :name

  include HTTParty

  def injury_update
    response = HTTParty.get('http://www.fantasyfootballnerd.com/service/injuries/json/test/')
    @injured = []
    #uses the API to populate @injured with the names of players injured that week
    response['Injuries'].each do |key, value|
      value.each do |injury|
        @injured << injury['playerName']
      end
    end
    #changes the player to injured true if they are hurt
    if @injured.include?(self.name)
      self.injured = true
      self.save!
    end
  end


end
