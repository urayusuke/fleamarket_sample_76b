Rails.application.routes.draw do
  get 'credits/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
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

  resources :credits, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'credits#pay'
    end
  end

  resources :purchase, only: [:show] do
    member do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end
