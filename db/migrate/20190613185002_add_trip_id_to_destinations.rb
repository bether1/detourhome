class AddTripIdToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :trip_id, :integer
  end
end
