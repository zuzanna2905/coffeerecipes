class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to recipe_path(@recipe)
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :content)
    end
end