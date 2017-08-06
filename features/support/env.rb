require 'cucumber/rails'
require 'rspec/matchers'
require 'spreewald/all_steps'
require 'cucumber/api_steps'

require 'simplecov'
SimpleCov.start do
  %w( features spec tmp public ).each do |dir|
    add_filter "/#{dir}/"
  end
  coverage_dir "public/coverage"
end
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter])

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Cucumber::Factory.add_steps(self)
