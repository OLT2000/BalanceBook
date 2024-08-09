class RemoveColumnFromEntries < ActiveRecord::Migration[7.1]
  def change
    remove_column :entries, :title, :string
  end
end
