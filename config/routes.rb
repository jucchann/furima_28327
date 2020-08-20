Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root "items#index"

  resources :users, only: :index
  resources :items do
    resources :purchases, only: [:index, :create]
  end
  resources :cards, only: [:new, :create]
end
