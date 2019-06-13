class RemovePlaceIdFromDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :place_id
    remove_column :trips, :place_id
  end
end
