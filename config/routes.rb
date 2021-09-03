Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "home#index"

  get "products", to: "products#index"
  post "products/create", to: "products#create", as: :create_product
  patch "products/edit", to: "products#edit", as: :edit_product
  delete "products/:id", to: "products#delete", as: :delete_product

  get "shopping-cart", to: "shopping_cart#show"
  post "shopping-cart/:product_id", to: "shopping_cart#add_product", as: :add_to_shopping_cart
end
