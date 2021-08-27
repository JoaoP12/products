Rails.application.routes.draw do
  root "home#index"

  get "products", to: "products#index"
  post "products/create", to: "products#create", as: :create_product
  patch "products/edit", to: "products#edit", as: :edit_product
  delete "products/:id", to: "products#delete", as: :delete_product

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"
  get "registration-confirmation/:id", to: "registrations#confirm_email",
    as: :registration_confirmation

  get "sign-in", to: "sessions#new"
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"

  resources :password_resets

  get "shopping-cart", to: "shopping_cart#show"

end
