class ReviewsController < ApplicationController
    def index
      @user = User.find_by(id: session[:user_id])
      @reviews = @user.reviews
    end

    def show
      @review = Review.find_by(id: params[:id])
    end

    def new      
      byebug
      @movie = Movie.find_by(id: session[:movie_id])
      @review = Review.new
    end

    def create 
      byebug
      @movie = Movie.find_by(id: session[:movie_id])
      @review = Review.new(review_params)
      if @review.save
        redirect_to review_path(@review)
      else
        flash[:errors] = @review.errors.full_messages
        render :new
      end
    end
    
    def update
    end

    def review_params
      x = params.require(:review).permit(:content)
      x[:user_id] = session[:user_id]
      x[:movie_id] = session[:movie_id]
      x
    end
end
