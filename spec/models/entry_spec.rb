require 'rails_helper'

RSpec.describe Entry, type: :model do
    let(:entry) { FactoryBot.build(:entry) }

    def calculate_expected_calories(entry)
        entry.protein * 4 + entry.carbs * 4 + entry.fats * 9
    end

    context 'Should Validate' do 
        it 'with entry_date, description, mood, steps, sleep_hrs, protein, carbs and fats present' do
            expect(entry).to be_valid
        end

        it 'calorie calculation' do
            true
        end

        it 'with no sleep_hrs' do
            entry.sleep_hrs = 0
            expect(entry).to be_valid
        end

        it 'with no steps' do
            entry.steps = 0
            expect(entry).to be_valid
        end

        it 'with no protein' do
            entry.protein = 0
            expect(entry).to be_valid
        end

        it 'with no carbs' do
            entry.carbs = 0
            expect(entry).to be_valid
        end

        it 'with no fats' do
            entry.fats = 0
            expect(entry).to be_valid
        end
    end

    context 'Should not validate' do
        numerical_inputs = [
            'mood',
            'steps',
            'sleep_hrs',
            'protein',
            'carbs',
            'fats'
        ]

        numerical_inputs.each do |k|
            it "negative #{k}" do
                entry[k] = -1
                expect(entry).not_to be_valid
            end
        end

        numerical_inputs.each do |k|
            it "non-numerical #{k}" do
                entry[k] = 'a'
                expect(entry).not_to be_valid
            end
        end

        it 'over 24 hours of sleep' do
            entry.sleep_hrs = 25
            expect(entry).not_to be_valid
        end
    end
    
end
