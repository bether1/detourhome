class AddJournalIdToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :journal_id, :integer
  end
end
