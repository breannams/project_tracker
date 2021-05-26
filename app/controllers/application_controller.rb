class ApplicationController < ActionController::Base
     before_action :require_log_in, except: [:login, :create, :home, :destroy]
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_log_in
        if !logged_in?
            redirect_to root_path
        end
    end
end
