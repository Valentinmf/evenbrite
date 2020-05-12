# frozen_string_literal: true

Rails.application.routes.draw do
  resources :admins, only: [:index] do
    resources :users
    root 'admins#index'
  end
  root 'events#index'
  resources :events do
    resources :attendances, only: [:index, :new, :create]
  end
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
