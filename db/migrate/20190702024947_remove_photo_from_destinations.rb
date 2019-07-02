class RemovePhotoFromDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :photo
  end
end
