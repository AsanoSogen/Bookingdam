Rails.application.routes.draw do

  devise_for :users

  root  "users#index"
  
  resources :signup_users, only: [:create] do
    collection do
      get 'step1'
      get "step2"
      post "step2"
      get 'complete' #登録完了後
    end
  end

  resources :users, only: [:index,:show] 

  
end
