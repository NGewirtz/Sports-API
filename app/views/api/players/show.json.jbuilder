json.players do
  json.array! @player, partial: 'api/players/player', as: :player
end
