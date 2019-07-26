class CreateIngredientRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_recipes do |t|
      t.references :ingredient, null: false
      t.references :recipe, null: false
      t.float :amount, null: false, default: 0

      t.timestamps null: false
    end
  end
end
