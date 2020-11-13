Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    member { get :delete }
  end
  resources :reviews, except: :destroy do
    member { get :delete }
  end
  resources :movies, only: [:index, :new, :create]

  put '/movie/:id/like', to: 'movies#like', as: 'like'
  put '/movie/:id/unlike', to: 'movies#unlike', as: 'unlike'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#home"

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'new_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/movies/select', to: 'movies#select', as: 'select_movie'
  get '/movies/:id', to: 'movies#show', as: 'movie'
  delete '/reviews/:id', to: 'reviews#destroy', as: 'destroy_review'
  get '/reviewed-movies', to: 'movies#reviewed', as: 'reviewed_movies'

  delete '/users/:id', to: 'users#destroy', as: 'destroy_user'

end
