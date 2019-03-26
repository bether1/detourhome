class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :place_id
      t.integer :user_id
      t.timestamps
    end
  end
end
