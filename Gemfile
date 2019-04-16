# frozen_string_literal: true

source 'https://rubygems.org'

ruby File.read('.ruby-version').match(/\d\.\d.\d/)[0]

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'puma'
gem 'rails'

gem 'dotenv-rails'
gem 'foreman'
#gem 'mysql2'
gem 'sqlite3', '~> 1.3.6'
gem 'will_paginate', '~> 3.1.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'

  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
  gem 'pry', '~> 0.12.2'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'overcommit', require: false

  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  gem 'rubocop', require: false
  gem 'rubycritic', require: false
end
