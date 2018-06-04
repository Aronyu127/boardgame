# == Schema Information
#
# Table name: game_rooms
#
#  id           :integer          not null, primary key
#  name         :string
#  type         :string
#  owner_id     :integer
#  game_id      :integer
#  status       :integer
#  limit_player :integer
#  data         :hstore
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Wolf::GameRoom < GameRoom
  has_many :game_users, class_name: 'Wolf::GameRoomUser', dependent: :destroy
  validates :owner_id, presence: true, uniqueness: true
end
