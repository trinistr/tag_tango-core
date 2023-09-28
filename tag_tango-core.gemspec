# frozen_string_literal: true

require_relative "lib/tag_tango/core/version"

Gem::Specification.new do |spec|
  spec.name = "tag_tango-core"
  spec.version = TagTango::Core::VERSION
  spec.authors = ["Alexandr Bulancov"]

  spec.summary = "A set of utility classes and files for TagTango"
  spec.homepage = "https://github.com/trinistr/tag_tango-core"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/trinistr/tag_tango-core"
  spec.metadata["changelog_uri"] = "https://github.com/trinistr/tag_tango-core/issues"
  spec.metadata["bug_tracker_uri"] = "https://github.com/trinistr/tag_tango-core/blob/main/CHANGELOG.md"

  spec.metadata["allowed_push_host"] = "https://example.com"  # Disable publishing for now
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*"] << ".rubocop.yml"
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-initializer", "~> 3"
  spec.add_dependency "dry-monads", "~> 1.6"
  spec.add_dependency "zeitwerk", "~> 2.6"
end
