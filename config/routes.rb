Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root "items#index"

  resources :users, only: [:index, :show, :update]
  resources :items do
    resources :purchases, only: [:index, :create]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :cards, only: [:new, :create]
end
