Rails.application.routes.draw do
  resources :order_items
  resources :users
  resources :orders
  resources :carts
  resources :categories
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
