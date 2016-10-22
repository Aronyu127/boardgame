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
end
