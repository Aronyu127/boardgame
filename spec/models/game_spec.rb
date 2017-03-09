# == Schema Information
#
# Table name: games
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#  data :hstore
#

require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
