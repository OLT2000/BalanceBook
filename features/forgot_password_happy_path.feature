Feature: Happy path test case when I forgot my password
    Scenario: successfully navigate to forgot password page
        Given I visit the page url 'http://localhost:3000/users/sign_in'
        When I click the link for path: '/users/password/new'
        Then I am redirected to the page url '/users/password/new'
    
    Scenario: Successful notice after submitting password
        Given I visit the page url 'http://localhost:3000/users/password/new'
        And I input 'ollienewtest3@email.com' for 'email' in my 'user' model
        When I click the 'Send me reset password instructions' button
        Then I am redirected to the page url '/users/sign_in'
        And I am given an alert: 'You will receive an email with instructions on how to reset your password in a few minutes.'