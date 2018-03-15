class Api::FootballsController < ApplicationController
  def index
    @football_players = Football.all
    render "api/footballs/index"
  end
end
