Feature: Trees are displayed correctly
  As a user,
  I want to be able to see my trees laid out in a readable way,
  So that I can understand the paths available to me.

  Background:
    Given I sign in

  Scenario: User can create an tree
    When I go to the root page
    And I click on "New Tree"
    And I fill in "Name" with "My tree"
    And I press "Save"
    Then I should see "My tree"

  Scenario: All objectives are displayed in the correct depth
    Given there is a tree with the name "My Tree" and the user "user@example.com"
    And there is an objective with the title "0-A" and the tree "My Tree"
    And there is an objective with the title "1-A" and the parent "0-A" and the tree "My Tree"
    And there is an objective with the title "1-B" and the parent "0-A" and the tree "My Tree"
    And there is an objective with the title "2-A-A" and the parent "1-A" and the tree "My Tree"
    And there is an objective with the title "2-A-B" and the parent "1-A" and the tree "My Tree"
    And there is an objective with the title "2-B-A" and the parent "1-B" and the tree "My Tree"
    When I go to the root page
    And I click on "My Tree"
    Then I should see that node "0-A" is in level 0 and has width of 3
    Then I should see that node "1-A" is in level 1 and has width of 2
    Then I should see that node "1-B" is in level 1 and has width of 1
    Then I should see that node "2-A-A" is in level 2 and has width of 1
    Then I should see that node "2-A-B" is in level 2 and has width of 1
    Then I should see that node "2-B-A" is in level 2 and has width of 1


