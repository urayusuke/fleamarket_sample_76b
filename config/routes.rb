Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'products#index'
  resources :products do
    member do
      get "purchase"
    end
  end
  
  resources :users do
    member do
      get "logout"
      get "info"
      get "address"
      get "credit"
    end
  end
end
