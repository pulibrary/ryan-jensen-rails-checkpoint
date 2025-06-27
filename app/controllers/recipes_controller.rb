class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      # Handle ingredients
      ingredient_names = params[:ingredient_names].to_s.split(',').map(&:strip).reject(&:empty?)

      ingredient_names.each do |name|
        ingredient = Ingredient.find_or_create_by(name: name)
        @recipe.ingredients << ingredient unless @recipe.ingredients.include?(ingredient)
      end

      redirect_to @recipe
    else
      render :new
    end

  rescue ActiveRecord::RecordNotUnique => e
    render file: File.join(Rails.root, "public", "400.html"), layout: false, status: 400

  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def list
    @recipes = nil
    @ids = Ingredient.find(params[:name])
    @ids.each do |id|
      @recipes.push(RecipeIngredient.find(params[:id]))
    end
  end

  private def recipe_params
    params.require(:recipe).permit(:name)
  end
end