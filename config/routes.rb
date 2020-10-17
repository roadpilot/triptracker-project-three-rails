Rails.application.routes.draw do
  resources :trip_locations
  resources :comments
  resources :trips
  resources :locations
  resources :users
  resources :users do
    resources :trips, only: [:new]
  end
  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end
