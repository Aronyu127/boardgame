# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{params['room']}:messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast "room-#{params['room']}:messages", message: data['message'], room_id: data['roomId']
  end

  def receive(payload)
    Message.create(user: current_user, game_room_id: params['room'], content: payload['message'])
  end
end
