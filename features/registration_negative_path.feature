Feature: Negative Test Cases When Filling Out Sign Up Form

    # Missing Fields
    Scenario: User doesn't provide a first name
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'wrongemail@email.com' for 'email' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        And I input 'Password123?' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "First name can't be blank."

    Scenario: User doesn't provide a last name
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'wrongemail@email.com' for 'email' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        And I input 'Password123?' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Last name can't be blank."
    
    Scenario: User doesn't provide an email
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        And I input 'Passwword123?' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Email can't be blank"

    Scenario: User does not provide a password
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'wrongemail@email.com' for 'email' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password can't be blank"
    
    Scenario: User does not provide a password confirmation
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'wrongemail@email.com' for 'email' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password confirmation can't be blank"


    # Field Errors
    Scenario: User provides an email that is already taken
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'ollienewtest3@email.com' for 'email' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        And I input 'Password123?' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Email has already been taken"

    Scenario: User does not provide a matching password
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'fakeemail@email.com' for 'email' in my 'user' model
        And I input 'Password123?' for 'password' in my 'user' model
        And I input 'nomatchingpassword' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password confirmation doesn't match Password"


    # Password Validations
    Scenario: Password is not 8 characters long
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'fakeemail@brandnewemail.com' for 'email' in my 'user' model
        And I input 'pass' for 'password' in my 'user' model
        And I input 'pass' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password must be at least 8 characters long."

    Scenario: Password contains no uppercase character
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'fakeemail@brandnewemail.com' for 'email' in my 'user' model
        And I input 'password1?' for 'password' in my 'user' model
        And I input 'password1?' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password must contain at least one uppercase letter."

    Scenario: Password contains no lowercase character
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'fakeemail@brandnewemail.com' for 'email' in my 'user' model
        And I input 'PASSWORD1?' for 'password' in my 'user' model
        And I input 'PASSWORD1?' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password must contain at least one lowercase letter."

    Scenario: Password contains no special character
        Given I visit the page url 'http://localhost:3000/users/sign_up'
        And I input 'Ollie' for 'first_name' in my 'user' model
        And I input 'Thurston' for 'last_name' in my 'user' model
        And I input 'fakeemail@brandnewemail.com' for 'email' in my 'user' model
        And I input 'Password1' for 'password' in my 'user' model
        And I input 'Password1' for 'password_confirmation' in my 'user' model
        When I click the 'Create Account' button
        Then I am redirected to the page url '/users/sign_up'
        And I am given a user form explanation "Password must contain at least one special character."