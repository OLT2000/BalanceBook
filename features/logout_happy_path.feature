Feature: Successful logging out feature
    Scenario: User is logged in successfully with existing credentials, and then logs out
        Given I visit the page url 'http://localhost:3000/users/sign_in'
        And I input 'ollienewtest12@email.com' for 'email' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        And I click the 'Log in' button
        And I am redirected to the page url '/'
        When I click the link for path: 'users/sign_out'
        Then I am redirected to the page url 'users/sign_in'
        And I am given an alert: 'Signed out successfully.'