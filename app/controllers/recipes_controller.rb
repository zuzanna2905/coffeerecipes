class RecipesController < ApplicationController
  before_action :set_recipe, only:  [:show]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = 'Article was successfully created!'
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :roaster, :time, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end