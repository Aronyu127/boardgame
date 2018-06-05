class InitWolfGameContext < BaseContext
  before_perform :check_roles
  before_perform :dispatch_character

  def initialize(wolf_game_room, roles)
    @wolf_game_room = wolf_game_room
    @roles = roles.reject(&:blank?).shuffle
  end

  def perform
    run_callbacks :perform do
      if @wolf_game_room.play!
        true
      else
        false
      end
    end
  end

  private

  def dispatch_character
    @wolf_game_room.game_users.each do |user|
      user.set_character(@roles.pop)
    end
    @wolf_game_room.table_cards = @roles
    @wolf_game_room.save
  end

  def check_roles
    return add_error(:setting_error, '選擇的角色數量 須比玩家人數多三名') if @roles.count != @wolf_game_room.game_users.count + 3
  end
end
