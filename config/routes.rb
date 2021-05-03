Rails.application.routes.draw do
  root to: 'images#index'

  delete "/images/destroy_many", to: "images#destroy_many"
  
  resources :images

  resources :users, only: [:new, :create, :show]

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  
  post "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#logout"

end
