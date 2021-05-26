
class SessionsController < ApplicationController
    def home
    end

    def login
    end

    def create
   
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:message] = "Invalid login information, please try again."
            redirect_to login_path(@user)
        end
    end

end