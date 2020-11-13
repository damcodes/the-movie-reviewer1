class MoviesController < ApplicationController
  def select 
  end

  def reviewed
    @movies = Review.all.map { |review| review.movie }.uniq
  end
  
  def index
    if !params[:movie_title].empty?
      @movies = Movie.get_movies(params[:movie_title])
    else
      flash[:notice] = "Enter a movie title."
      render :select
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @reviews = @movie.reviews
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
