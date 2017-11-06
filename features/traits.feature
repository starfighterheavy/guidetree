Feature: Traits
  As a user,
  I want to be able to give objectives traits,
  So that I can see what accomplishing each objective will get me.

  Background:
    Given I sign in

  Scenario: User can create a trait
    When I go to the root page
    And I click on "Traits"
    And I click on "New"
    And I fill in "Title" with "My new title"
    And I fill in "Description" with "My new description"
    And I press "Save"
    Then I should see "My new title"
    Then I should see "My new description"

  Scenario: User update a trait
    Given there is a trait with the title "My trait" and the user "user@example.com"
    When I go to the root page
    And I click on "Traits"
    And I click on "My trait"
    And I click on "Edit"
    And I fill in "Title" with "My updated trait title"
    And I press "Save"
    Then I should see "My updated trait title"

  Scenario: System prevents creating trait without title
    When I go to the root page
    And I click on "Traits"
    And I click on "New"
    And I fill in "Title" with ""
    And I press "Save"
    Then I should see "Title can't be blank"

  Scenario: User delete can delete a trait
    Given there is a trait with the title "My trait" and the user "user@example.com"
    When I go to the root page
    And I click on "Traits"
    And I click on "My trait"
    And I click on "Delete"
    Then I should not see "My trait"
