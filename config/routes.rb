Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :users, only: :index
  resources :items, only: [:index, :new, :create, :show]
  resources :purchases, only: :new

end
