require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { FactoryBot.build(:user) }

    context 'Should Validate' do 
        it 'with email, first_name, last_name, password and password_confirmation present' do
            expect(user).to be_valid
        end
    end

    context 'Should not validate' do
        it 'When first_name is not present' do
            user.first_name = nil
            expect(user).not_to be_valid
        end

        it 'When last_name is not present' do
            user.last_name = nil
            expect(user).not_to be_valid
        end

        it 'When email is not present' do
            user.email = nil
            expect(user).not_to be_valid
        end

        it 'When email does not contain an @ symbol' do
            user.email = 'myemail.com'
            expect(user).not_to be_valid
        end

        it 'When password is not present' do
            user.password = nil
            expect(user).not_to be_valid
        end

        it 'When password is not long enough' do
            user.password = "Pas1?"
            expect(user).not_to be_valid
        end

        it 'When pssword_confirmation is not present' do
            user.password_confirmation = nil
            expect(user).not_to be_valid
        end

        it 'When password does not contain an uppercase character' do
            user.password = 'password123?'
            expect(user).not_to be_valid
        end

        it 'When password does not contain a lowercase character' do
            user.password = 'PASSWORD123?'
            expect(user).not_to be_valid
        end

        it 'When password does not contain a special character' do
            user.password = 'Password123'
            expect(user).not_to be_valid
        end

        it 'When password does not contain a numerical character' do
            user.password = 'Password?>'
            expect(user).not_to be_valid
        end
    
    end
    
end
