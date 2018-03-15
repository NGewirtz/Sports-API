class Api::PlayersController < ApplicationController
  def show
    sport = params[:sport].capitalize
    first_name = params[:first].downcase
    last_name = params[:last].downcase
    query = "type = ? AND lower(first_name) = ? AND lower(last_name) = ?"
    @player = Player.where(query, sport, first_name, last_name)
    if @player.empty?
      render json: { "Error" => "Player Not Found" }, status: 404
    else
      render "api/players/show"
    end
  end
end
