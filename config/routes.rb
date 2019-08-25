Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  post '/callback' => 'linebot#callback'
  resources :problems
  root to: "problems#index"
  resources :logs, only: [:index]
  resources :users, only: [:index]




  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

end
