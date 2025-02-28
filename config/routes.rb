Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions'
  }

  resources :movies, only: [:index, :create, :show, :update, :destroy]

  root to: "movies#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
