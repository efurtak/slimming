Rails.application.routes.draw do

  resources :accounts, only: [:show, :edit, :update]

  devise_for :users

  root to: 'welcome#index'
end
