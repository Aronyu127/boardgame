# == Schema Information
#
# Table name: game_rooms
#
#  id           :integer          not null, primary key
#  name         :string
#  owner_id     :integer
#  game_id      :integer
#  status       :integer
#  limit_player :integer
#  data         :hstore
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class GameRoom < ApplicationRecord
  has_many :users, as: :player
  belongs_to :owner, class_name: :User
  belongs_to :game
end
