Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :foods, only: [:index, :show]
  resources :services, only: :index
  resources :news, only: :index
end
