Rails.application.routes.draw do
  devise_for :users
  # You can have the root of your site routed with "root"
  root 'base#index'

  get '/authorizations/:provider/callback', to: 'authorizations#callback'
  get '/authorizations/failure' => 'authorizations#failue', as: :auth_failure
  Setting.omniauth.providers.keys.each do |provider|
    get "/authorizations/#{provider}", as: "auth_#{provider}"
  end

  namespace :api, defaults: { format: 'json' } do
    post '/login' => 'authorization#login'
    post '/logout' => 'authorization#logout'
  end
end
