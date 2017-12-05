When /^I log the page$/ do
  puts page.body
end

Given 'I sign in' do
  steps %Q{
    Given there is a user with the email "user@example.com" and the password "Password1"
    And I go to the root page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "Password1"
    And I press "Log in"
  }
end

Given /^I visit "([^"]*)"$/ do |path|
  visit path
end
