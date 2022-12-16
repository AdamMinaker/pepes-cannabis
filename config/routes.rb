Rails.application.routes.draw do
  get 'cart/show'
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  post "products/add_quantity/:id", to: "products#add_quantity", as: "add_quantity"

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :order_items
  resources :users
  resources :carts
  resources :categories
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get "/about", to: "about#index"
  get "/contact", to: "contact#index"
  get "/orders", to: "orders#show"
  get "/cart", to: "cart#show"
  post 'cart/add'
  post 'cart/remove'
end
