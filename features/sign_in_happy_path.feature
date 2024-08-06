Feature: Successful login features
    Scenario: User is logged in successfully with existing credentials
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_in'
        And I input 'ollietest@email.com' for 'email' in my 'user' model
        And I input 'Password123!' for 'password' in my 'user' model
        When I click the 'Log In' button
        Then I am redirected to the page url '/'
        And I am given an alert: 'Signed in successfully.'
        And I clear the session

    Scenario: User is logged in successfully, even when there is trailing whitespace
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_in'
        And I input 'ollietest@email.com   ' for 'email' in my 'user' model
        And I input 'Password123!' for 'password' in my 'user' model
        When I click the 'Log In' button
        Then I am redirected to the page url '/'
        And I am given an alert: 'Signed in successfully.'
        And I clear the session

    Scenario: User is logged in successfully, even when there is different casing in the email
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_in'
        And I input '  ollietest@email.com' for 'email' in my 'user' model
        And I input 'Password123!' for 'password' in my 'user' model
        When I click the 'Log In' button
        Then I am redirected to the page url '/'
        And I am given an alert: 'Signed in successfully.'
        And I clear the session

    Scenario: User is logged in successfully, even with trailing whitespace on the password
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_in'
        And I input 'ollie@newemail.com' for 'email' in my 'user' model
        And I input '  Password123!   ' for 'password' in my 'user' model
        When I click the 'Log In' button
        Then I am redirected to the page url '/'
        And I am given an alert: 'Signed in successfully.'
        And I clear the session

