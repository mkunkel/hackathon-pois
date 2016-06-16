Rails.application.routes.draw do
  resources :pois, except: [:new, :edit]
  resources :tips, except: [:new, :edit]
  resources :images, except: [:new, :edit]
end
