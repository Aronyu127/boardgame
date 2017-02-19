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
  include AASM
  has_many :users
  belongs_to :owner, class_name: :User
  belongs_to :game
  validates :game, :name, presence: true
  validates :owner, uniqueness: true, presence: true
  enum status: {
    waiting: 1,
    processing: 2,
    ending: 3
  }

  aasm column: :status, enum: true do
    state :waiting, initial: true
    state :processing, :ending

    event :play do
      transitions from: :waiting, to: :processing
    end

    event :close do
      transitions from: :processing, to: :ending
    end
  end
end
