class WelcomeController < ApplicationController
  def home
    if session[:user_id]
      session[:logged_in] = true
      @user = User.find_by(id: session[:user_id])
    end
  end
end
