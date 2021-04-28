Rails.application.routes.draw do
  root to: 'images#index'
  get "/images/select", to: "images#select"

  resources :images
end
