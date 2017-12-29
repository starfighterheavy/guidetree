Feature: Objective Traits
  As a user,
  I want to be able to assign traits to an objective
  So I can know what is accomplished with each objective.

  Background:
    Given I am "New User"
    And I sign in

  Scenario: User can create an objective trait
    When I go to the root page
    And I click on "My Tree"
    And I click on "2-A-A"
    And I click on "Add Trait"
    And I fill in "Amount" with "10"
    And I select "Armor" from "Trait"
    And I press "Save"
    Then I should see "+10 Armor"

  Scenario: User can update an objective
    When I go to the root page
    And I click on "My Tree"
    And I click on "1-A"
    And I click on "+10 Armor"
    And I fill in "Amount" with "5"
    And I press "Save"
    Then I should see "+5 Armor"

  Scenario: System prevents creation without amount
    When I go to the root page
    And I click on "My Tree"
    And I click on "2-A-A"
    And I click on "Add Trait"
    And I select "Armor" from "Trait"
    And I fill in "Amount" with ""
    And I press "Save"
    Then I should see "Amount can't be blank"

  Scenario: User can delete an objective trait
    When I go to the root page
    And I click on "My Tree"
    And I click on "1-A"
    And I click on "+10 Armor"
    And I click on "Remove"
    Then I should not see "+10 Armor"

  Scenario: User can create a new trait while creating a new objective trait
    When I go to the root page
    And I click on "My Tree"
    And I click on "1-A"
    And I click on "Add Trait"
    And I click on "Need a new trait?"
    And I should see "New Trait"
