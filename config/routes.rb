Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  root "home#index"

  get "projects/new", to: "projects#new", as: "new_project"
  get "projects", to: "projects#index"
  post "projects", to: "projects#create"

  get "products", to: "products#index"
end
