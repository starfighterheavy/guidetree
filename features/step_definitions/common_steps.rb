When /^I log the page$/ do
  puts page.body
end

Given 'I sign in' do
  steps %Q{
    When I go to the root page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "Password1"
    And I press "Log in"
  }
end
