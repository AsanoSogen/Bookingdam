Rails.application.routes.draw do

  devise_for :users

  root  "users#index"
  
  resources :users, only: [:index, :new, :create, :show] do
    collection do
      get 'step'
      post "step"
      get 'complete' #登録完了後
    end
  end
  
end
