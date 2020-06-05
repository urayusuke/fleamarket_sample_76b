Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :users do
    member do
      get "logout"
      get "info"
      get "address"
      get "credit"
    end
  end
end
