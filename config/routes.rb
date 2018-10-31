Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}


  get 'products', to: 'products#index'

  root "home#index"
  resources :projects

end
