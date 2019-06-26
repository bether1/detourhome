class AddIndexToPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :photo_id
    add_index :photos, [:user_id, :destination_id]
    add_index :photos, :destination_id
  end
end
