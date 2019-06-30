class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :is_admin?, :require_admin
    before_action :require_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def is_admin?
        current_user.admin
    end

    def require_user
        if !logged_in?
            flash[:success] = 'You must be logged in to preform that action'
            redirect_to login_path
        end
    end

    def require_admin        
        if !is_admin?
            flash[:success] = 'You must be admin to preform that action'
            redirect_to recipes_path
        end
    end
end
