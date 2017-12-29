ruby '2.4.3'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'puma', '~> 3.7'

gem 'pg', '~> 0.21'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'therubyracer', platforms: :ruby

gem 'slim'

gem 'simple_form'

gem 'dotenv-rails'

gem 'gretel', '~> 3.0'

gem 'coffee-rails', '~> 4.2'

gem 'turbolinks', '~> 5'

gem 'devise', '~> 4.4'

gem 'rails-rapido', '~> 0.3'

gem 'kaminari'

group :test do
  gem 'cucumber-rails', require: false

  gem 'cucumber-sammies', '~> 0.1'

  gem 'cucumber-api-steps'

  gem 'database_cleaner'

  gem 'rspec-rails'

  gem 'simplecov'

  gem 'simplecov-console'
end

group :development, :test do
  gem 'pry'

  gem 'cucumber-persona'

  gem 'cucumber-inventory', github: 'starfighterheavy/cucumber-inventory'
end
