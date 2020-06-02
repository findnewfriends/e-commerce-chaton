Rails.application.routes.draw do

  default_url_options :host => "https://e-commerce-chatons-fnf.herokuapp.com/"

  get '/', to: 'items#index'
  # get '/cart', to: 'carts#index'

  #resources :orders
  resources :carts
  resources :items
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
