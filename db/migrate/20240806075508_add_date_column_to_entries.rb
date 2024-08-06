class AddDateColumnToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :entry_date, :date
  end
end
