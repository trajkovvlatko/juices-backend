class UpdateIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :amount
    remove_column :ingredients, :recipe_id
  end
end
