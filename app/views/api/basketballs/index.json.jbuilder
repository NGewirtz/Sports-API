json.players do
  json.array! @basketball_players, partial: 'api/players/player', as: :player
end
