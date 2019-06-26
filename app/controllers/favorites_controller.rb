class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
  end

  def new
  end

  def create
    favorite = Recipe.find(params[:recipe_id])
    unless current_user.favorites.include?(favorite)
      Favorite.create(recipe: favorite, user: current_user)
      flash[:success] = 'Favorite was successfully added!'
      redirect_to favorites_path
    else
      flash[:success] = 'Something was wrong with your favorites'
      redirect_to favorites_path
    end
  end

  def destroy
    Favorite.where(recipe: params[:recipe_id],user: current_user).first.destroy
    flash[:danger] = 'Recipe was successfully destroyed!'
    redirect_to recipes_path
  end
end