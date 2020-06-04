Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :users do
    member do
      get "logout"
    end
  end
end
