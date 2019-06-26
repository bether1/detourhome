class AddDestinationIDtoPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :destination_id, :integer
  end
end
