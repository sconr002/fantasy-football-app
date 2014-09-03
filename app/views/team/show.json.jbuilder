json.array! @players do |player|
  json.name     player.name
  json.pos      player.pos
  json.team     player.nfl_team
  json.injured  player.injured
  json.bye      player.bye
end

#need to add NFL team to this, but I may have to change
#what that looks like in the DB to do so


#this is the old index page
# %h3 Enter your players below
#
# - if current_user
#   %p
#     = form_tag("/profile", method: "post") do
#       = label_tag( "Add Player")
#       %br
#       = text_field_tag "player"
#       = submit_tag "Submit"
#
# - else
#   %li= link_to "Log In", new_user_session_path
#   %li= link_to "Sign up", new_user_registration_path
