class GameRoomsController < BaseController
  before_action :authenticate_user!, execpt: [:index, :show]
  before_action :game_room
  before_action :check_owner, only: [:start_game, :destroy]

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
      current_user.update_attributes(current_room: game_room)
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

  def destroy
    if game_room.destroy
      redirect_as_success(game_rooms_path, '遊戲室已關閉')
    else
      render_as_fail(:show, game_room.errors.full_messages)
    end
  end

  def during_game
  end

  def enter_game
    current_user.current_room = game_room
    if current_user.save
      redirect_as_success(during_game_game_room_path(game_room), "成功進入遊戲室-#{game_room.name}")
    else
      render_as_fail(:back, game_room.errors.full_messages)
    end
  end

  def start_game
    game_room.play
    if game_room.save
      ActionCable.server.broadcast("spy_game_channel_#{game_room.id}",
                                   message: '開始遊戲',
                                   user: @game_room.owner.name)
      redirect_as_success(during_game_game_room_path(game_room), '遊戲開始')
    else
      render_as_fail(:show, game_room.errors.full_messages)
    end
  end

  private

  def game_room
    @game_room ||= params[:id] ? GameRoom.find(params[:id]) : GameRoom.new(game_room_params)
  end

  def game_room_params
    params.fetch(:game_room, {}).permit(:name, :owner_id, :game_id, :limit_player)
  end

  def check_owner
    redirect_as_fail(game_room_path(@game_room), '房主才可進行此操作') unless @game_room.owner == current_user
  end
end
