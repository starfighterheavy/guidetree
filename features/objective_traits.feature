Feature: Objective Traits
  As a user,
  I want to be able to assign traits to an objective
  So I can know what is accomplished with each objective.

  Background:
    Given there is a tree with the name "My Tree"
    And there is an objective with the title "0-A" and the tree "My Tree"
    And there is a trait with the title "Armor"

  Scenario: User can create an objective trait
    When I go to the root page
    And I click on "My Tree"
    And I click on "0-A"
    And I click on "Add Trait"
    And I fill in "Amount" with "10"
    And I select "Armor" from "Trait"
    And I press "Save"
    Then I should see "+10 Armor"
    When I click on "My Tree"
    Then I should see "+10 Armor"

  Scenario: User can update an objective
    Given there is an objective trait with the amount "10" and the objective "0-A" and the trait "Armor"
    When I go to the root page
    And I click on "My Tree"
    And I click on "0-A"
    And I click on "+10 Armor"
    And I fill in "Amount" with "5"
    And I press "Save"
    Then I should see "+5 Armor"

  Scenario: System prevents creation without amount
    When I go to the root page
    And I click on "My Tree"
    And I click on "0-A"
    And I click on "Add Trait"
    And I select "Armor" from "Trait"
    And I fill in "Amount" with ""
    And I press "Save"
    Then I should see "Amount can't be blank"

  Scenario: User can delete an objective trait
    Given there is an objective trait with the amount "10" and the objective "0-A" and the trait "Armor"
    When I go to the root page
    And I click on "My Tree"
    And I click on "0-A"
    And I click on "+10 Armor"
    And I click on "Remove"
    Then I should not see "+10 Armor"
