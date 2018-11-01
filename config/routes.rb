Rails.application.routes.draw do
  root "home#index"
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  get "products", to: "products#index"

  resources :projects do
    resources :ratings, only: [:create]
  end
end
