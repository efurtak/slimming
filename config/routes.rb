Rails.application.routes.draw do

  resources :shoes, only: [:index, :show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get '/bmi', to: 'bmi#bmi'

  resources :weight_records, only: [:index, :new, :edit, :create, :update]
  resources :accounts, only: [:show, :edit, :update]

  devise_for :users

  root to: 'welcome#index'
end
