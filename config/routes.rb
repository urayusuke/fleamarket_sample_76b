Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :users
  resources :addresses, only: :new do
    collection do
      get "create_page"
    end
  end
end
