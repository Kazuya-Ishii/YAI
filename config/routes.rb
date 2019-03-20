Rails.application.routes.draw do
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

  resources :relationships,       only: [:create, :destroy]
  resources :topics

end
