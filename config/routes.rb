Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users

  resources  :users, only: %i[index]
  resources :groups, only: %i[index new create destroy] do
    resources :entities, only: %i[index show new create destroy]
  end

  root to: 'users#index'
end
