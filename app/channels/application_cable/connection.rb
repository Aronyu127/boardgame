# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      current_user = User.find_by(id: cookies.signed[:user_id])
      if current_user && current_user.current_room
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
