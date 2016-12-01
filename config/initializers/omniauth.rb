Rails.application.config.middleware.use OmniAuth::Builder do
  Setting.omniauth.providers.each do |provider, data|
    data = data.deep_symbolize_keys
    provider provider, data[:facebook_app_id], data[:facebook_secret], data[:options] || {}
  end
end

ActiveRecord::Base.send(:include, ::Omniauthable)

OmniAuth.config.path_prefix = "/authorizations"
