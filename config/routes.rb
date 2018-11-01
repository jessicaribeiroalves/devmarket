Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}


  get 'products', to: 'products#index'
  get 'projects/dashboard', to: 'projects#dashboard'

  root "home#index"
  resources :projects

end
