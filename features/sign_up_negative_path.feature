Feature: Negative Test Cases When Filling Out Sign Up Form
    Scenario: User provides an email that is already taken
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'ollie4@newemail.com' for 'email' in my 'user' model
        And I input 'password' for 'password' in my 'user' model
        And I input 'password' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Email has already been taken"

    Scenario: User does not provide a password
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'ollie4@brandnewemail.com' for 'email' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password can't be blank"

    Scenario: User does not provide an email
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'password' for 'password' in my 'user' model
        And I input 'password' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Email can't be blank"

    Scenario: User does not provide a password confirmation
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'ollie4@brandnewemail.com' for 'email' in my 'user' model
        And I input 'password' for 'password' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password confirmation doesn't match password"

    Scenario: User does not provide a password confirmation
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'ollie4@brandnewemail.com' for 'email' in my 'user' model
        And I input 'password' for 'password' in my 'user' model
        And I input 'nomatchingpassword' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password confirmation doesn't match Password"

    Scenario: User does not provide a password 
        Given I visit the page url 'https://mysite-gize.onrender.com/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'ollie4@brandnewemail.com' for 'email' in my 'user' model
        And I input 'password' for 'password' in my 'user' model
        And I input 'nomatchingpassword' for 'password_confirmation' in my 'user' model