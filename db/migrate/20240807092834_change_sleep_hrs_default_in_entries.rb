class ChangeSleepHrsDefaultInEntries < ActiveRecord::Migration[7.1]
  def change
      change_column :entries, :sleep_hrs, :float, default: 0.0 
  end
end
