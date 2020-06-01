Rails.application.routes.draw do
  #resources :orders
  resources :carts
  resources :items
  devise_for :users
  resources :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
