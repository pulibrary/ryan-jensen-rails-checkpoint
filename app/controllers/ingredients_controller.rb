class IngredientsController < ApplicationController

  def index
    @ingredient = Ingredient.new
    @recipes = []
  end

  def new
    @ingredient = Ingredient.new
    @recipes = []
  end
  
  def create
    @ingredient = Ingredient.new
    @recipes = []

    ingredient_names = params[:ingredient_names].to_s.split(',').map(&:strip).reject(&:empty?)

    ingredient_names.each do |name|
      ingredient_id = Ingredient.find_by(name: name)&.id
      recipe_id = RecipeIngredient.find_by(ingredient_id: ingredient_id)&.recipe_id
      unless (@recipes.include?(Recipe.find(recipe_id)))
        @recipes.push(Recipe.find(recipe_id))
      end
    end

    render :show

    rescue ActiveRecord::RecordNotFound => e
    render file: File.join(Rails.root, "public", "400.html"), layout: false, status: 400

  end

  def show
    @recipes
  end

end
