Feature: Public UUID

  Scenario: Tree can be accessed by public link without authentication
    Given "New User" exists
    When I visit "/trees/abcdefg"
    Then I should see "My Tree"
