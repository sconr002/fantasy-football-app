class Player < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :name

  include HTTParty

  def all_injuries
    response = HTTParty.get('http://www.fantasyfootballnerd.com/service/injuries/json/test/')
    @injured = []
    response['Injuries'].each do |key, value|
      value.each do |injury|
        @injured << injury['playerName']
      end
    end
  end

  

end


# EXAMPLE FROM SPOTIFY TOP TRACKS API
# class Spotify
#   include HTTParty
#   base_uri 'https://api.spotify.com'
#
#   def self.top_tracks_for
#     response = get "/v1/artists/4LhV33vJvXmFGSM3m5RzUR/top-tracks?country=US"
#     #james simplified version of the code I wrote
#     @tracks = response['tracks'].first(10).map do |h|
#       Track.new(h['name'], h['album']['name'], h['external_urls']['spotify'])
#     end
#   end
