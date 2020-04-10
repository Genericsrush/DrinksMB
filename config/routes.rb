Rails.application.routes.draw do
  get 'pages/index'
  get '/p/:permalink', to: 'pages#permalink', as: "permalink"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to:'drink#index'
  resources :drink, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
