Rails.application.routes.draw do
  root "home#index"
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  get 'products', to: 'products#index'
  get 'projects/dashboard', to: 'projects#dashboard'

  resources :projects do
    resources :ratings, only: [:create]
    member do
      post "status_complete", to: "projects#status_complete"
    end
  end
end
