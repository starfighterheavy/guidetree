Feature: Trees are displayed correctly
  As a user,
  I want to be able to see my trees laid out in a readable way,
  So that I can understand the paths available to me.

  Background:
    Given there is an objective with the title "0-A"
    And there is an objective with the title "1-A" and the parent "0-A"
    And there is an objective with the title "1-B" and the parent "0-A"
    And there is an objective with the title "2-A-A" and the parent "1-A"
    And there is an objective with the title "2-A-B" and the parent "1-A"
    And there is an objective with the title "2-B-A" and the parent "1-B"

  Scenario: All objectives are displayed in the correct depth
    When I go to the root page
    Then I should see that node "0-A" is in level 0 and has width of 3
    Then I should see that node "1-A" is in level 1 and has width of 2
    Then I should see that node "1-B" is in level 1 and has width of 1
    Then I should see that node "2-A-A" is in level 2 and has width of 1
    Then I should see that node "2-A-B" is in level 2 and has width of 1
    Then I should see that node "2-B-A" is in level 2 and has width of 1


