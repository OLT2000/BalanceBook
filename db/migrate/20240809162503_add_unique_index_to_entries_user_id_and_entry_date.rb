class AddUniqueIndexToEntriesUserIdAndEntryDate < ActiveRecord::Migration[6.0]
  def change
    add_index :entries, [:user_id, :entry_date], unique: true
  end
end