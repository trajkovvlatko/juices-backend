class AddSelectedToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :selected, :boolean, default: false, null: false
  end
end
