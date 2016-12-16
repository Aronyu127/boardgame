Rails.application.routes.draw do
  devise_for :users
  # You can have the root of your site routed with "root"
  root 'game_rooms#index'

  get '/authorizations/:provider/callback', to: 'authorizations#callback'
  get '/authorizations/failure' => 'authorizations#failue', as: :auth_failure
  Setting.omniauth.providers.keys.each do |provider|
    get "/authorizations/#{provider}", as: "auth_#{provider}"
  end

  resources :game_rooms

  namespace :api, defaults: { format: 'json' } do
    post '/login' => 'authorization#login'
    post '/logout' => 'authorization#logout'
  end
end
