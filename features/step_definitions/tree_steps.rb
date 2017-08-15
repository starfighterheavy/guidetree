Then /^I should see that node "(.*)" is in level ([0-9]+) and has width of ([0-9]+)$/ do |title, level, width|
  page.find("#level_#{level}").find(".node-content", text: title)
end

Then 'I print the page' do
  puts page.body
end
