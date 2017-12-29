Feature: Objectives
  As a user,
  I want to be able to create, edit and delete objectives,
  So that I can easily modify my tree.

  Background:
    Given I am "New User"
    And I sign in

  Scenario: User can create a new root objective
    When I go to the root page
    And I click on "My Tree"
    And I click on "New Objective"
    And I fill in "Title" with "My new title"
    And I fill in "Description" with "My new description"
    And I press "Save"
    Then I should see "My new title"
    Then I should see "My new description"
    When I click on "My Tree"
    Then I should see that node "My new title" is in level 0 and has width of 1

  Scenario: User can create a new child objective
    When I go to the root page
    And I click on "My Tree"
    And I click on "1-A"
    And I click on "New Child"
    Then I should see "1-A>New Child"
    When I fill in "Title" with "My new title"
    And I fill in "Description" with "My new description"
    And I press "Save"
    Then I should see "My new title"
    And I should see "My new description"
    When I click on "My Tree"
    Then I should see that node "My new title" is in level 2 and has width of 1

  Scenario: User can update an objective
    When I go to the root page
    And I click on "My Tree"
    And I click on "2-A-A"
    And I click on "Edit"
    Then "Other-A" should not be an option for "Parent"
    When I fill in "Title" with "My updated title"
    And I fill in "Description" with "My updated description"
    And I select "1-A" from "Parent"
    And I press "Save"
    Then I should see that node "My updated title" is in level 2 and has width of 1

  Scenario: User can complete an objective
    When I go to the root page
    And I click on "My Tree"
    And I click on "2-A-A"
    And I click on "Complete"
    And I fill in "Note" with "I did it!"
    And I press "Save"
    Then I should see "My Tree"

  Scenario: System prevents assigning self as parent
    When I go to the root page
    And I click on "My Tree"
    And I click on "1-A"
    And I click on "Edit"
    Then "1-A" should not be an option for "Parent"

  Scenario: User can delete an objective
    When I go to the root page
    And I click on "My Tree"
    And I click on "2-A-A"
    And I click on "Delete"
    Then I should not see "2-A-A"

  Scenario: System prevents deletion of objective with children
    When I go to the root page
    And I click on "My Tree"
    And I click on "1-A"
    And I click on "Delete"
    Then I should see "Objective cannot be deleted while it has children"

  Scenario: User can navigate from objective back to tree
    When I go to the root page
    And I click on "My Tree"
    And I click on "1-A"
    And I click on "My Tree"
    Then I should see "0-A"
