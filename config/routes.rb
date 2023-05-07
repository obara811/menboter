Rails.application.routes.draw do
  root to: "problems#index"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :create]
  resources :problems, except: [:index, :edit]
end
