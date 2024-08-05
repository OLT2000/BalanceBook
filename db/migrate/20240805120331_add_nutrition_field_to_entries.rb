class AddNutritionFieldToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :mood, :integer, limit: 1
    add_column :entries, :sleep_hrs, :decimal, precision: 3, scale: 1, limit: 1
    add_column :entries, :steps, :integer, default: 0
    add_column :entries, :protein, :integer, default: 0
    add_column :entries, :carbs, :integer, default: 0
    add_column :entries, :fats, :integer, default: 0
    add_column :entries, :calories_in, :integer, as: '4*protein + 4*carbs + 9*fats', stored: true
  end
end
