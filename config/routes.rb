Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users

  root 'expenses#index'
  resources :reports, only: [:index]
  resources :expenses
end
