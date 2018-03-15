json.players do
  json.array! @football_players, partial: 'api/players/player', as: :player
end
