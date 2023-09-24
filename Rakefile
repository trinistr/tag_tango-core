# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

desc "Run Undercover"
task :undercover do
  sh(*%w[bundle exec undercover])
end

task default: %i[rubocop spec undercover]
