Rails.application.routes.draw do
  root 'home#index'
  resources :posts do
    resources :comments
  end
resources :sessions, only: [:new, :create, :destroy]
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
 get 'logout', to: 'sessions#destroy'
  end 