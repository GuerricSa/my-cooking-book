class AddIngredientNameToConpositions < ActiveRecord::Migration[7.0]
  def change
    add_column :compositions, :ingredient_name, :string
  end
end
