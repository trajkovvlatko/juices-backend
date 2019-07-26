class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.string :measurement, null: false
      t.references :recipe

      t.timestamps null: false
    end
  end
end
