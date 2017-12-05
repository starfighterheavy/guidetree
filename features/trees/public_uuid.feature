Feature: Public UUID

  Scenario: Tree can be accessed by public link without authentication
    Given there is a user with the email "user@example.com" and the password "Password1"
    And there is a tree with the name "My Tree" and the user "user@example.com" and public_uuid "abcdefg"
    And I visit "/trees/abcdefg"
    Then I should see "My Tree"
