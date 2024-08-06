Feature: Happy path test case when I sign up to the application
    Scenario: Successful sign up completion
        # Given I am on the page url 'http://127.0.0.1:3000/users/sign_up'
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'olliethurston@email.com' for 'email' in my 'user' model
        And I input 'password' for 'password' in my 'user' model
        And I input 'password' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url 'https://mysite-gize.onrender.com/'
        And I am given a 'success' alert: 'Welcome! You have signed up successfully.'
