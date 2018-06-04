class GameRoomsController < BaseController
  before_action :authenticate_user!, execpt: [:index, :show]
  before_action :game_room
  before_action :check_owner, only: [:start_game, :destroy, :update]
  before_action :check_game_room_waiting, only: [:enter_game, :leave_game]
  before_action :check_not_in_room, only: [:create, :enter_game]

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
      Wolf::GameRoomUser.create(game_room_id: game_room.id, user_id: current_user.id)
      redirect_as_success(game_room_path(game_room), '遊戲室已建立')
    else
      render_as_fail(:new, game_room.errors.full_messages)
    end
  end

  def update
    if game_room.update_attributes(game_room_params)
      redirect_as_success(game_room_path(game_room), '遊戲室已更改')
    else
      render_as_fail(:edit, game_room.errors.full_messages)
    end
  end

  def destroy
    if current_user.own_room.destroy
      redirect_as_success(game_rooms_path, '遊戲室已關閉')
    else
      render_as_fail(:show, game_room.errors.full_messages)
    end
  end

  def during_game
  end

  def enter_game
    game_user = Wolf::GameRoomUser.find_or_create_by(game_room_id: game_room.id, user_id: current_user.id)
    if game_user
      redirect_as_success(game_room_path(game_room), "成功進入遊戲室-#{game_room.name}")
    else
      render_as_fail(:back, game_user.errors.full_messages)
    end
  end

  def leave_game
    game_user = Wolf::GameRoomUser.find_by(game_room_id: game_room.id, user_id: current_user.id).destroy
    if game_user.destroy
      redirect_as_success(game_rooms_path, "成功退出遊戲室-#{game_room.name}")
    else
      render_as_fail(:back, game_user.errors.full_messages)
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
    params.fetch(:game_room, {}).permit(:name, :owner_id, :limit_player, :type)
  end

  def check_owner
    redirect_as_fail(game_room_path(@game_room), '房主才可進行此操作') unless @game_room.owner == current_user
  end

  def check_not_in_room
    redirect_as_fail(game_rooms_path, '你已經參加了其他遊戲室') if Wolf::GameRoomUser.find_by(user_id: current_user.id)
  end

  def check_game_room_waiting
    render_as_fail(:back, '已開始的遊戲無法進行此項操作') unless game_room.status == 'waiting'
  end
end
