
class SessionsController < ApplicationController
    def home
    end

    def new
      @user = User.new
    end

    def create
   
        @user = User.find_by(username: params[:username])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to login_path(@user)
        end
    end

end