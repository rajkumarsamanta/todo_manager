Rails.application.routes.draw do
  get "/", to: "home#index"
  #post "users/login", to: "users#login"
  resources :todos, :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
