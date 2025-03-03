Rails.application.routes.draw do
  use_doorkeeper
  # Devise routes with custom controllers
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations', # Ensure you have overridden the registrations controller if needed
    passwords: 'users/passwords'
  }

  # Movies resource routes
  resources :movies, only: [:index, :create, :show, :update, :destroy]

  # Root path
  root to: "movies#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
