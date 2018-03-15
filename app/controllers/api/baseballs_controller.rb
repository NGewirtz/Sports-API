class Api::BaseballsController < ApplicationController
  def index
    @baseball_players = Baseball.all
    render "api/baseballs/index"
  end
end
