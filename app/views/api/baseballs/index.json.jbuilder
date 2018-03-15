json.players do
  json.array! @baseball_players, partial: 'api/players/player', as: :player
end
