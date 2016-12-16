class GameRoomsController < ApplicationController
  def index
    @game_rooms = GameRoom.all
  end
end
