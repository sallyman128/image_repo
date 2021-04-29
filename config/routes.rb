Rails.application.routes.draw do
  root to: 'images#index'

  get "/images/select", to: "images#select"
  delete "/images/select", to: "images#many_destroy"
  resources :images

  resources :users, only: [:new, :create, :show]

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"

end
