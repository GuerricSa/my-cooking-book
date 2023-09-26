class CompositionsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @composition = Composition.new(composition_params)
    @ingredient = Ingredient.find_by(name: @composition.ingredient_name)
    @composition.recipe = @recipe
    @composition.ingredient_id = @ingredient.id
    if @composition.save
      redirect_to recipe_path(@recipe)
    end
  end

  private

  def composition_params
    params.require(:composition).permit(:quantity, :ingredient_name)
  end
end
