Rails.application.routes.draw do
  resources :comments
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
      member do
        get :following, :followers
      end
    end

  resources :relationships,   only: [:create, :destroy]
  resources :topics do
    resources :comments
  end

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end
