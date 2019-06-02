Rails.application.routes.draw do
  post '/callback' => 'linebot#callback'
  resources :problems
  root to: "problems#index"
  resources :logs, only: [:index]
end
