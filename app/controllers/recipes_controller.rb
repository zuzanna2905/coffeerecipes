class RecipesController < ApplicationController
    before_action :set_recipe, only:  [:show, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
  
    def index
      @recipes = Recipe.all
    end
  
    def new
      @recipe = Recipe.new
    end
  
    def edit
    end
    
    def update
      if @recipe.update(recipe_params)
        flash[:success] = 'Recipe was successfully updated!'
        redirect_to recipe_path(@recipe)
      else
        render 'edit'
      end
    end
  
    def table
      @recipes = Recipe.paginate(page: params[:page], per_page: 10)
    end
  
    def favorites 
    end
  
    def create
      @recipe = Recipe.new(recipe_params)
      @recipe.user = current_user
      if @recipe.save
        flash[:success] = 'Recipe was successfully created!'
        redirect_to recipe_path(@recipe)
      else
        render 'new'
      end
    end
  
    def show
    end
  
    def destroy
      @recipe.destroy
      flash[:danger] = 'Recipe was successfully destroyed!'
      redirect_to recipes_path
    end
  
    private
    def recipe_params
      params.require(:recipe).permit(:name, :roaster, :temperature, :water, :dose, :method, :grinder, :clicks, :time, :description, :rate)
    end
  
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
  
    def require_same_user
      if current_user != @recipe.user
        flash[:danger] = 'You can only edit or delete your own recipes'
        redirect_to root_path
      end
    end
  
  end