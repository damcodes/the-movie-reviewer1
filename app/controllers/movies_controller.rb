class MoviesController < ApplicationController
  def select 
  end
  
  def index
    @movies = Movie.get_movies(params[:movie_title])
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @reviews = @movie.reviews
    @user = User.find_by(id: session[:user_id])
  end

  def like 
    #grabbing the review
    @movie = Movie.all.find(params[:id])
    #creating a like with that post and the current users id
    Like.create(user_id: session[:user_id], movie_id: @movie.id)
    #redirecting them back to that post
    redirect_to movie_path(@movie)
  end

  def new
    movie_params = Movie.get_movie_details(params[:movie][:imdb_id])
    if !Movie.find_by(imdbid: params[:movie][:imdb_id])
      @movie = Movie.new(movie_params)
      @movie.save
    else
      @movie = Movie.find_by(imdbid: params[:movie][:imdb_id])
    end
    session[:movie_id] = @movie.id
    redirect_to new_review_path
  end

  def create 
  end
    
  def update
  end
end
