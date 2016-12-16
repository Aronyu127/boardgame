# == Schema Information
#
# Table name: spy_game_roles
#
#  id    :integer          not null, primary key
#  name  :string
#  place :integer
#

class SpyGameRole < ApplicationRecord
  has_many :users
end
