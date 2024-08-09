class Entry < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    
    validate :validate_all_non_negative
    validates :sleep_hrs, numericality: { less_than_or_equal_to: 24 }

    validates :entry_date, uniqueness: { scope: :user_id, message: "should be unique per user. Please edit it instead" }

    
    def validate_non_negative(field)
        fieldvalue = send(field)
        puts(field, fieldvalue)
        if fieldvalue < 0
            errors.add field, "can't be negative"
            return false
        end
        true
    end

    def validate_upper_bound(field, upper_bound)
        fieldvalue = send(field)
        if fieldvalue > upper_bound
            errors.add field, "can't be greater than #{upper_bound}"
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

    def validate_steps
        if steps < 0
            errors.add :steps, "can't be less than zero."
            return false
        end
        true
    end

end
