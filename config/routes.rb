Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  root "home#index"
  resources :projects

  # # get "projects/new", to: "projects#new", as: "new_project"
  # # get "projects", to: "projects#index"
  # # post "projects", to: "projects#create"
  # get "projects/:id", to: "projects#show"

  get "products", to: "products#index"

  # get 'users/show'
  # post 'users/create'
  # get ‘projects/new’
  # get 'users/edit'
  # delete 'users/destroy'
  # put 'users/update'
  # patch 'users/update'
end
