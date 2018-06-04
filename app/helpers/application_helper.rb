module ApplicationHelper
  def collect_for_games
    [['一夜狼人', 'Wolf::GameRoom']]
  end

  def collect_for_limit_player
    (3..8).to_a
  end

  def collect_for_spy_game_room_ids
    GameRoom.where(game: 1).pluck(:id)
  end
end
