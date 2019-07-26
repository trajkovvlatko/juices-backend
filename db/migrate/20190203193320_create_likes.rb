class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, null: false
      t.references :recipe, null: false

      t.timestamps null: false
    end
  end
end
