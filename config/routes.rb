Rails.application.routes.draw do
  get "/", to: "home#index"
  post "users/login", to: "users#login"
  resources :todos, :users
end
