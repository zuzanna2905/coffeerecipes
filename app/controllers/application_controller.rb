class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :require_user
    def current_user
        @current_student ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:success] = 'You must be logged in to preform that action'
            redirect_to login_path
        end
    end
end
