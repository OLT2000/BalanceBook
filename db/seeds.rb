# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

require 'faker'

# Define a constant password for all users
PASSWORD = 'Password123?'

# Helper method to generate unique dates
def generate_unique_dates(start_date, end_date, count)
    (start_date..end_date).to_a.sample(count).uniq
  end

# Create 5 users
10.times do |user_index|
    user_index += 1
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "test#{user_index}@email.com",
      password: PASSWORD,
      password_confirmation: PASSWORD
    )
  
    # Generate unique dates for the entries
    unique_dates = generate_unique_dates(14.days.ago.to_date, Date.today, rand(10..20))
  
    # Create entries for the user
    unique_dates.each do |date|
      Entry.create!(
        entry_date: date,
        description: Faker::Lorem.sentence,
        mood: rand(0..10),
        sleep_hrs: rand(0..24).to_f,
        steps: rand(0..10000), # Assuming a maximum of 10,000 steps
        protein: rand(70..200), # Protein between 70 and 200 grams
        carbs: rand(100..400), # Carbs between 100 and 400 grams
        fats: rand(50..200), # Fats between 50 and 200 grams
        user_id: user.id
      )
    end
  end

