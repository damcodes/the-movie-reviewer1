class ReviewsController < ApplicationController

  # before_action :authenticate_user, only: [:like]
  # before_action :set_post, only: [:show, :like]


  def index
    @user = User.find_by(id: session[:user_id])
    @reviews = @user.reviews
  end

  def show
    @review = Review.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def new      
    @movie = Movie.find_by(id: session[:movie_id])
    @review = Review.new
  end

  def create 
    @movie = Movie.find_by(id: session[:movie_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      flash[:errors] = @review.errors.full_messages
      render :new
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end
    
  def update
    @review = Review.find_by(id: params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  # def like 
  #   if !current_user.liked? @review
  #     @review.liked_by current_user
  #   elsif current_user.liked? @review
  #     @review.unliked_by current_user
  # end

  def delete
    @review = Review.find_by(id: params[:id])
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy 
    redirect_to reviews_path
  end

  private

  def review_params
    x = params.require(:review).permit(:content)
    if !(params[:action] == 'update')
      x[:user_id] = session[:user_id]
      x[:movie_id] = session[:movie_id]
    end
    x
  end
end
