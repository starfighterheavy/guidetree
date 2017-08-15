Feature: Objectives
  As a user,
  I want to be able to create, edit and delete objectives,
  So that I can easily modify my tree.

  Background:
    Given there is an objective with the title "0-A"
    And there is an objective with the title "1-A" and the parent "0-A"
    And there is an objective with the title "1-B" and the parent "0-A"
    And there is an objective with the title "2-A-A" and the parent "1-A"

  Scenario: User can create an objective
    When I go to the root page
    And I click on "New Objective"
    And I select "0-A" from "Parent"
    And I fill in "Title" with "My new title"
    And I press "Save"
    Then I should see that node "My new title" is in level 1 and has width of 1

  Scenario: User update an objective
    When I go to the root page
    And I click on "2-A-A"
    And I click on "Edit"
    And I fill in "Title" with "My updated title"
    And I select "1-A" from "Parent"
    And I press "Save"
    Then I should see that node "My updated title" is in level 2 and has width of 1

  Scenario: User delete an objective
    When I go to the root page
    And I click on "2-A-A"
    And I click on "Delete"
    Then I should not see "2-A-A"

  Scenario: System prevents deletion of objective with children
    When I go to the root page
    And I click on "1-A"
    And I click on "Delete"
    Then I should see "Objective cannot be deleted while it has children"
