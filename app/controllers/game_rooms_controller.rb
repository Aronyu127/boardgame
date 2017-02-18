class GameRoomsController < BaseController
  before_action :game_room

  def index
    @game_rooms = GameRoom.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    game_room.owner = current_user
    if game_room.save
      redirect_as_success(game_room_path(game_room), '遊戲室已建立')
    else
      render_as_fail(:new, game_room.errors.full_messages)
    end
  end

  def update
    game_room.owner = current_user
    if game_room.update_attributes(game_room_params)
      redirect_as_success(game_room_path(game_room), '遊戲室已更改')
    else
      render_as_fail(:edit, game_room.errors.full_messages)
    end
  end

  private

  def game_room
    @game_room ||= params[:id] ? GameRoom.find(params[:id]) : GameRoom.new(game_room_params)
  end

  def game_room_params
    params.fetch(:game_room, {}).permit(:name, :owner_id, :game_id, :limit_player)
  end
end
