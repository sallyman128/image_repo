Rails.application.routes.draw do
  root to: 'images#index'
  get "/images/select", to: "images#select"
  delete "/images/select", to: "images#many_destroy"

  resources :images
end
