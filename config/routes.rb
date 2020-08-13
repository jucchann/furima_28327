Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :users, only: :index
  resources :items do
    member do
      get :purchase
    end
  end


end
