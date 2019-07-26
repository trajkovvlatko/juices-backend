class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :path, null: false
      t.references :recipe

      t.timestamps null: false
    end
  end
end
