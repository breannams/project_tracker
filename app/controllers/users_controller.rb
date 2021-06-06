class UsersController < ApplicationController
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
        @user = User.find_by_id(params[:id])
        if @user != current_user
            flash[:message] = "you do not have access to this user's profile."
            redirect_to user_path(current_user)
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
