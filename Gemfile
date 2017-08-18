ruby '2.3.3'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'slim'
gem 'simple_form'
gem 'dotenv-rails'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :test do
  gem 'cucumber-rails', require: false
  gem 'cucumber_priority'
  gem 'cucumber_factory'
  gem 'cucumber-api-steps'
  gem 'factory_girl_rails'
  gem 'spreewald'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'simplecov-console'
end

group :development, :test do
  gem 'pry'
  gem 'timecop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end
