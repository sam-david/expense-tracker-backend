Rails.application.routes.draw do
  devise_for :users

  root 'expenses#index'
  resources :reports, only: [:index]
  resources :expenses
end
