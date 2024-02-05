Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users

  resources  :users, only: %i[index]
  resources :groups, only: %i[index new create destroy]

  root to: 'users#index'
end
