# == Schema Information
#
# Table name: wolf_game_room_users
#
#  id              :integer          not null, primary key
#  game_room_id    :integer
#  user_id         :integer
#  initial_role_id :integer
#  finial_role_id  :integer
#  revealing_data  :hstore
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Wolf::GameRoomUser < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :game_room
  validates :user, uniqueness: { scope: :game_room }

  enum status: {
    initial: 0,
    waiting: 1,
    ready: 2,
    done: 3
  }

  aasm column: :status, enum: true do
    state :initial, initial: true
    state :waiting, :ready, :done
  end
end
