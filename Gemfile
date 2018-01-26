# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.4.0"

# Attach cloud and local files in Rails applications
gem "activestorage"

# Relational algebra
gem "arel", github: "rails/arel"

# Official AWS Ruby gem for Amazon Simple Storage Service (Amazon S3)
gem "aws-sdk-s3", "~> 1"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"

# Use ActiveStorage variant
gem "mini_magick", "~> 4.8"

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use sqlite3 as the database for Active Record
gem "pg", "~> 0.21"

# Use Puma as the app server
gem "puma", "~> 3.7"

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", github: "rails/rails"

# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# Authentication

# Devise is a flexible authentication solution for Rails based applications
gem "devise", "~> 4.3.0"

# Javascript

# JQuery for rails
gem "jquery-rails", "~> 4.3.1"

# CSS

# Bootstrap 4 ruby gem for Ruby on Rails (Sprockets)
# and Hanami (formerly Lotus).
gem "bootstrap", "~> 4.0.0.beta2.1"

gem "coffee-rails"

# HTTP/REST API client library
gem 'faraday', '~> 0.14.0'

group :test do
  gem "database_cleaner"
  gem "faker"
  gem "shoulda-matchers"
end

group :development, :test do
  # factory_bot_rails provides Rails integration for factory_bot
  gem "factory_bot_rails", "~> 4.8"
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.15"

  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"

  # Combine 'pry' with 'byebug'
  gem "pry-byebug", "~> 3.5.0"

  gem "selenium-webdriver"

  # A Ruby client that tries to match Redis' API one-to-one, while still
  # providing an idiomatic interface.
  gem "redis", "~> 4.0.1"

  # rspec-rails is a testing framework for Rails 3.x, 4.x and 5.0.
  gem "rspec-rails"

  # Ruby static code analyzer
  gem "rubocop", "~> 0.52.0", require: false
  # extracting assigns and assert_template from ActionDispatch.
  gem "rails-controller-testing", "~> 1.0.2"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # Access an interactive console on exception pages or by
  # calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  # Guard::RSpec automatically run your specs
  gem "guard-rspec", "~> 4.7", require: false
  # this gem implements the rspec command for Spring.
  gem "spring-commands-rspec", "~> 1.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
