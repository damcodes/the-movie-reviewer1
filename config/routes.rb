Rails.application.routes.draw do
  resources :users
  resources :studios
  resources :roles
  resources :reviews
  resources :movies
  resources :genres
  resources :directors
  resources :actors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
