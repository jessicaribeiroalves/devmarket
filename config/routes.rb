Rails.application.routes.draw do
  root "home#index"
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  get 'products', to: 'products#index'  
  get 'projects/dashboard', to: 'projects#dashboard'
  get 'projects/dashboard_developer', to: 'projects#dashboard_developer'

  root "home#index"
  
  resources :projects do
    resources :bids, only: [:create]
    resources :ratings, only: [:create]
    member do
      post "status_complete", to: "projects#status_complete"
    end
  end

end
