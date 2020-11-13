class UsersController < ApplicationController

    def show
    end

    def new
      @user = User.new
    end

    def create 
      @user = User.new(user_params)
      if @user.save
        redirect_to login_path
      else
        flash[:errors] = @user.errors.full_messages
        render :new
      end
    end
    
    def update
    end

    def delete
      @user = User.find_by(id: session[:user_id])
    end

    def destroy
      @user = User.find_by(id: session[:user_id])
      @user.destroy
      flash[:destroyed_user] = "Account deactivated"
      redirect_to logout_path
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
