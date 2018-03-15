class Api::BasketballsController < ApplicationController
  def index
    @basketball_players = Basketball.all
    render "api/basketballs/index"
  end
end
