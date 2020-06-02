Rails.application.routes.draw do

  root 'items#index'
  get '/cart', to: 'carts#index'

  resources :join_order_items
  resources :orders
  resources :carts
  resources :items
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
