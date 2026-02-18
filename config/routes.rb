Rails.application.routes.draw do
  get "users/show"
  get "users/edit"
  root 'static_pages#home'
  resources :gossips do
    resources :comments
  end
  # On ajoute edit et update pour le profil
  resources :users, only: [:show, :edit, :update, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
end