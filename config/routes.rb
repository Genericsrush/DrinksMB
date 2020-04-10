Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to:'drink#index'
  resources :drink, only: :show
  get 'country_of_origin/:id', to: 'country_of_origin#show', as: 'country_of_origin'
  get 'pages/index'
  get '/p/:permalink', to: 'pages#permalink', as: "permalink"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
