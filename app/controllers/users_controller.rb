class UsersController < ApplicationController
    before_action :set_user, only:[:show]
    before_action :require_log_in, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end

    end

    def show
     
    end


    private
    def set_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
