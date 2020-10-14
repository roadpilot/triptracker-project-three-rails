Rails.application.routes.draw do
  resources :trip_locations
  resources :comments
  resources :trips
  resources :locations
  resources :users
  root 'application#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
