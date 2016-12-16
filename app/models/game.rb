# == Schema Information
#
# Table name: games
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#  data :hstore
#

class Game < ApplicationRecord
  has_many :game_room
end
