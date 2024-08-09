Feature: Happy path test case when I sign up to the application
    Scenario: Successful sign up completion
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'ollienewtest3@email.com' for 'email' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        And I input 'Password123?' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/'
        And I am given an alert: 'Welcome! You have signed up successfully.'
        And I clear the session
    
    Scenario: User successfully redirects to sign up instead of log in
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_in'
        When I click the link for path: 'users/sign_up'
        Then I am redirected to the page url '/users/sign_up'


    