FactoryBot.define do
    factory :entry do
        title { 'Entry #1 '}
        description { 'Some description of my day' }
        mood { 5 }
        sleep_hrs { 10 }
        steps { 10000 }
        protein { 100 }
        carbs { 200 }
        fats { 80 }
        entry_date { Date.today }
        user_id { user['id'] }

        association :user
    end
end