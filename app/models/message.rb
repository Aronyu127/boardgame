class Message < ApplicationRecord
  belongs_to :game_room
  belongs_to :user

  after_create_commit { MessageBroadcastJob.perform_now self }
end
