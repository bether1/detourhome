class AddPhotoIdToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :photo_id, :integer
  end
end
