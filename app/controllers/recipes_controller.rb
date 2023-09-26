class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_recipe, only: %i[show edit update destroy]
  def index
    @recipes = Recipe.all
  end

  def show
    @composition = Composition.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @recipe = Recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :cooking_time, :composition, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
