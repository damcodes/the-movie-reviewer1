class MoviesController < ApplicationController
  def select 
  end
  
  def index
    @movies = Movie.get_movies(params[:movie_title])
  end

  def show
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
    redirect_to new_review_path(:movie => {:movie_id => @movie.id})
  end

  def create 
  end
    
  def update
  end
end
