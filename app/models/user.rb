# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  admin                  :boolean          default(FALSE)
#  game_room_id           :integer
#  spy_game_role_id       :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  include Redis::Objects
  store_accessor :data, :facebook_account, :facebook_id, :facebook_token, :facebook_avatar
  belongs_to :spy_game_role
  has_many :game_room, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  omniauthable

  def self.get_fb_data(access_token)
    require_data = 'email,name'
    res = HTTParty.get 'https://graph.facebook.com/v2.4/me', params: { access_token: access_token }, fields: require_data

    if res.code == 200
      JSON.parse(res.to_str)
    else
      Rails.logger.warn(res.body)
      nil
    end
  end
end
