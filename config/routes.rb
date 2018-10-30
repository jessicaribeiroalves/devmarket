Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get 'products', to: 'products#index'
  post 'projects', to: 'projects#create'
  get 'projects/new', to: 'projects#new', as: 'new_project'
end
