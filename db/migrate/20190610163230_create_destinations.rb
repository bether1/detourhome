class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.text :name
      t.text :description
      t.string :address
      t.integer :place_id
      t.timestamps
    end
  end
end
