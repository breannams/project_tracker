
class SessionsController < ApplicationController
  skip_before_action :require_log_in
  
    def create
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else 
                flash[:message] = "Invalid login information, please try again."
                redirect_to '/login'
            end
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth['uid']) do |user|
            user.username = auth['info']['name']
            user.password = SecureRandom.hex
          end
          if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            redirect_to '/'
          end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end