Feature: Sad path test case when I forgot my password
    Scenario: Failed attempt when email s not an account
        Given I visit the page url 'http://localhost:3000/users/password/new'
        And I input 'fakeemail123@email.com' for 'email' in my 'user' model
        When I click the 'Send me reset password instructions' button
        Then I am redirected to the page url '/users/password/new'
        And I am given a user form explanation "Email not found"

    Scenario: Failed attempt when email is blank
        Given I visit the page url 'http://localhost:3000/users/password/new'
        When I click the 'Send me reset password instructions' button
        Then I am redirected to the page url '/users/password/new'
        And I am given a user form explanation "Email can't be blank"
    