Rails.application.routes.draw do
  resources :pois, only: [:create, :show, :index]
  resources :tips, only: [:create, :show, :index]
  resources :images, only: [:create, :show, :index]
end
