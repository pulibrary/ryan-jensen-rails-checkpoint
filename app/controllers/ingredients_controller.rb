class IngredientsController < ApplicationController

  require "byebug"

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
      @recipes.push(Recipe.joins(:ingredients).where("ingredients.name = ?", name))
    end

    render :show

    rescue ActiveRecord::RecordNotFound => e
    render file: File.join(Rails.root, "public", "400.html"), layout: false, status: 400

  end

  def show
    @recipes
  end

end
