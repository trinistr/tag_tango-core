# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in tag_tango-tag_parser.gemspec
gemspec

group :build do
  gem "rake", "~> 13.0"
  gem "rubocop", "~> 1.21"
end

group :doc do
  gem "yard"
end

group :test do
  gem "rspec", "~> 3.0"
  gem "rubocop-rspec"
  gem "simplecov", require: false
  gem "simplecov-lcov", require: false
  gem "undercover", require: false
end

group :human do
  gem "pry", "~> 0.14.2"
end
