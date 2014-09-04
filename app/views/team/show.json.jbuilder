json.array! @players do |player|
  json.name     player.name
  json.pos      player.pos
  json.team     player.nfl_team
  json.injured  player.injured
  json.bye      player.bye
end
