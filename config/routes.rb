Rails.application.routes.draw do
  root "home#index"
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

  get "products", to: "products#index"

  resources :profiles, only: [:index, :show]
  resources :images, only: [:create, :destroy]

  get "projects/dashboard", to: "projects#dashboard"
  post "projects/dashboard", to: "bids#accept_bid"

  get "projects/dashboard_developer", to: "projects#dashboard_developer"

  resources :projects do
    resources :bids
    resources :ratings, only: [:create]
    member do
      post "cancel_bid", to: "projects#cancel_bid"
      post "cancel_project", to: "projects#cancel_project"
      post "status_complete", to: "projects#status_complete"
    end
  end
end
