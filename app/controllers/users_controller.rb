class UsersController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_user, only: [:edit, :show, :update]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
    end

    def create 
        @user = User.new(user_parms)
        if @user.save
            flash[:success] = 'You have successfully signed up!'
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
    end

    def update 
        if @user.update(user_parms)
            flash[:success] = 'You have successfully updated your profile'
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_parms
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_same_user
        if current_user != @user
            flash[:success] = 'You can only edit your own profile'
            redirect_to user_path(user_user)
        end
    end
end