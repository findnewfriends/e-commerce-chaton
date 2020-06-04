Rails.application.routes.draw do

  get 'charges/new'
  get 'charges/create'
  default_url_options :host => "https://e-commerce-chatons-fnf.herokuapp.com/"

  root :to => "items#index"
  # get '/cart', to: 'carts#index'

  resources :orders
  resources :charges
  resources :carts
  resources :items
  devise_for :users
  resources :users
  resources :users, only:  :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
