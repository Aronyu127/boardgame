Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root 'game_rooms#index'

  get '/authorizations/:provider/callback', to: 'authorizations#callback'
  get '/authorizations/failure' => 'authorizations#failue', as: :auth_failure
  Setting.omniauth.providers.keys.each do |provider|
    get "/authorizations/#{provider}", as: "auth_#{provider}"
  end

  resources :game_rooms do
    member do
      post :start_game
      post :enter_game
      delete :leave_game
      get :during_game
    end
  end

  namespace :api, defaults: { format: 'json' } do
    post '/login' => 'authorization#login'
    post '/logout' => 'authorization#logout'
  end
end
