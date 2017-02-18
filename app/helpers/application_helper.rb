module ApplicationHelper
  def collect_for_games
    Game.all.map { |c| [c.name, c.id] }
  end

  def collect_for_limit_player
    (3..8).to_a
  end
end
