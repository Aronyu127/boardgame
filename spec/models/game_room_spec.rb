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

require 'rails_helper'

RSpec.describe GameRoom, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
