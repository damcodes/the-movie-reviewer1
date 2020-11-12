Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :reviews, only: [:new, :create, :show, :index]
  resources :movies, only: [:index, :new, :create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get /login to sessions#new
    # - form 
  # post /sessions to sessions#create
    # = create session
  
  #get '/users/new', to: "users#new"
  #post '/users/new', to: "users#create"

  root to: "welcome#home"

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'new_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/movies/select', to: 'movies#select', as: 'select_movie'

end
