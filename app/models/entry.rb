class Entry < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    
    validate :validate_all_non_negative
    validates :sleep_hrs, numericality: { less_than_or_equal_to: 24 }

    validates :entry_date, uniqueness: { scope: :user_id, message: "should be unique per user. Please edit it instead" }

    [
        :mood,
        :steps,
        :sleep_hrs,
        :protein, 
        :carbs, 
        :fats
    ].each do |key|
        validates key, numericality: true
    end

    
    def validate_non_negative(field)
        fieldvalue = send(field)
        if fieldvalue < 0
            errors.add field, "can't be negative"
            return false
        end
        true
    end

    private 

    def validate_all_non_negative
        numerical_inputs = [
            :mood, :steps, :sleep_hrs, :protein, :carbs, :fats
        ]
        numerical_inputs.each do |field_key|
            validate_non_negative field_key
        end
        puts errors
    end

end
