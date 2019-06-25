class FavoritesController < ApplicationController
    def index
      @favorites = Favorite.paginate(page: params[:page], per_page: 5)
    end

    def new
      @favorite = Favorite.new
    end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    if @favorite.save
      flash[:success] = 'Favorite was successfully created!'
      redirect_to favorites_path
    end
  end

  private 
  def favorite_params
    params.require(:favorite).permit(:recipe_id)
  end

end