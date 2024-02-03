Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users

  resources  :users, only: %i[index]

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'users#index'
end
