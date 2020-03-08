Rails.application.routes.draw do

  # devise_for :users

  # devise_for :host_users, controllers: {
  #   sessions:      'host_users/sessions',
  #   passwords:     'host_users/passwords',
  #   registrations: 'host_users/registrations'
  # }         

  root  "users#index"
  
  resources :users, only: [:index] 

  # resources :host_users, only: [:index, :show, :new, :create, :edit, :update]

  

end
