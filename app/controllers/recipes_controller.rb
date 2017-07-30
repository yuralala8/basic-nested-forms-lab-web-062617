class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe_id: '0')
    @recipe.ingredients.build(recipe_id: '1')
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end


  private

  def recipe_params
    params.require(:recipe).permit(
    :title,
    ingredients_attributes: [
      :name,
      :quantity
    ]
    )
  end
end
