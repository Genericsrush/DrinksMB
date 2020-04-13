Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to:'drink#index'

  post 'add_to_cart/:id', to: 'application#add_to_cart', as: 'add_to_cart'
  #delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as 'remove_from_cart'

  resources :drink, only: :show
  get 'sale', to: 'drink#sale', as: 'sale'
  get 'new', to: 'drink#new', as: 'new'
  get 'country_of_origin/:id', to: 'country_of_origin#show', as: 'country_of_origin'
  get 'pages/index'
  get '/p/:permalink', to: 'pages#permalink', as: "permalink"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
