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

class Wolf::Role < ApplicationRecord
end
