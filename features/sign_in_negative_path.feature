Feature: Negative Test Cases When Signing In
    Scenario: User provides a non-existent email address
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_in'
        And I input 'nonexistentemail@email.com' for 'email' in my 'user' model
        And I input 'Password123!' for 'password' in my 'user' model
        When I click the 'Log in' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given an alert: 'Invalid Email or password.'

    Scenario: User provides an incorrect password
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_in'
        And I input 'ollienewtest2@email.com' for 'email' in my 'user' model
        And I input 'Password12345678!' for 'password' in my 'user' model
        When I click the 'Log in' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given an alert: 'Invalid Email or password.'


