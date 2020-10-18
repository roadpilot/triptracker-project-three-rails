Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trip_locations, only: [:show,:create,:destroy]
  # resources :comments  FOR FUTURE USE
  resources :locations, only: [:index,:create]
  # resources :users, only: []

  # resources :users, only: [:show,:new,:create] do
  resources :users, only: [:show,:new,:create] do
    resources :trips, only: [:new]
  end
  resources :trips, only: [:index,:show,:new,:create,:destroy]

  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/logout' => 'sessions#destroy'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
