# == Schema Information
#
# Table name: wolf_roles
#
#  id         :integer          not null, primary key
#  name       :string
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Wolf::Role, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
