class LoginsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    def new
    end

    def create
        user = User.find_by(email: params[:logins][:email].downcase)
        if user && user.authenticate(params[:logins][:password])
            session[:user_id] = user.id
            flash.now[:success] = 'You have successfully logged in'
            redirect_to user_path(user)
        else
            flash.now[:success] = 'Something was wrong with your login information'
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'You have successfully logged out'
        redirect_to root_path
    end
end