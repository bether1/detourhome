class RemovePicturesFromDestination < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :picture
    remove_column :destinations, :journal_id
    remove_column :destinations, :photo_id
  end
end
