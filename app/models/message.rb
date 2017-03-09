# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  content      :string
#  game_room_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :game_room
  belongs_to :user

  validates :content, presence: true
  after_create_commit { MessageBroadcastJob.perform_now self }
end
