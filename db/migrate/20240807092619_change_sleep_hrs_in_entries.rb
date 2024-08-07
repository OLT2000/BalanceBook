class ChangeSleepHrsInEntries < ActiveRecord::Migration[7.1]
    def change
        change_column :entries, :sleep_hrs, :float
    end
end
