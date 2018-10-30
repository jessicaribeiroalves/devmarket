Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
  
  root "home#index"


  get 'products', to: 'products#index'
  post 'projects', to: 'projects#create'
  get 'projects/new', to: 'projects#new', as: 'new_project'

  get "users/sign_in"
  get "projects", to: "projects#index"
       
  
  # get 'users/show'
  # post 'users/create'
  # get ‘projects/new’
  # get 'users/edit'
  # delete 'users/destroy'
  # put 'users/update'
  # patch 'users/update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
