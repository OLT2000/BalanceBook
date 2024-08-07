class Entry < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"

    numerical_inputs = [
        :mood, :steps, :sleep_hrs, :protein, :carbs, :fats
    ]
    
    numerical_inputs.each do |key|
        validates key, numericality: { greater_than_or_equal_to: 0 }
    end

    validates :steps, numericality: { only_integer: true }

    validates :sleep_hrs, numericality: { less_than_or_equal_to: 24 }
    
end
