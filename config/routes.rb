Rails.application.routes.draw do

  get '/bmi', to: 'bmi#bmi'

  resources :weight_records, only: [:index, :new, :edit, :create, :update]
  resources :accounts, only: [:show, :edit, :update]

  devise_for :users

  root to: 'welcome#index'
end
