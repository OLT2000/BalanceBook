FactoryBot.define do
    factory :user do
        first_name { 'Ollie' }
        last_name { 'Thurston' }
        email { 'ollie@email.com' }
        password { 'Password123?' }
        password_confirmation { 'Password123?' }
    end
end