Rails.application.routes.draw do
  devise_for :users
  post '/callback' => 'linebot#callback'
  resources :problems
  root to: "problems#index"
  resources :logs, only: [:index]
end
