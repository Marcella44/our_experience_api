Rails.application.routes.draw do
  resources :users
  post '/login', to: 'sessions#create'

  resources :profiles

  resources :users do
    resources :posts, only: [:create]
  end  
  
  resources :posts

  resources :forums

  resources :diagnoses


end
