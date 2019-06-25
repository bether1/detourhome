class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.text :entry
      t.integer :user_id
      t.integer :destination_id
      t.integer :trip_id
      t.timestamps
    end

    add_index :journals, [:user_id, :destination_id]
    add_index :journals, :destination_id
  end
end
