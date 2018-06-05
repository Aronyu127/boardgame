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

require 'rails_helper'

RSpec.describe Wolf::GameRoomUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
