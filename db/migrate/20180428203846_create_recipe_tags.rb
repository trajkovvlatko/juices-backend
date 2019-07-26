class CreateRecipeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_tags do |t|
      t.integer :recipe_id, null: false
      t.integer :tag_id, null: false
      t.integer :amount, null: false, default: 1

      t.timestamps null: false
    end
  end
end
