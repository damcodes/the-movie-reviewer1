class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user
      #return head(:forbidden) unless @user.authenticate(params[:password])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        session[:logged_in] = true
        redirect_to root_path
      else
        flash[:incorrect] = "Incorrect password. Try again."
        render :new
      #session[:user_id] = @user.id
      #session[:logged_in] = true
      #redirect_to root_path
      end
    else
      flash[:incorrect] = "Incorrect username. Try again."
      render :new
    end
  end

  def destroy
    session.delete :user_id
    flash[:notice] = "You've been logged out."
    session[:logged_in] = false
    redirect_to root_path
  end

  private
  def session_params
    params.permit(:username, :password)
  end
  
end
