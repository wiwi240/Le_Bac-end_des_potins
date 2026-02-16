Rails.application.routes.draw do
  root 'gossips#index'
  
  resources :gossips do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :comments, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  
  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'
end