# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_inspector"
  spec.version       = RailsInspector::VERSION
  spec.authors       = %x{git log --format=format:"%an"}.split("\n")
  spec.email         = %x{git log --format=format:"%ae"}.split("\n")

  spec.summary       = %q{Library to help inspecting a Rails project}
  spec.description   = <<-DESC
Helps you inspect a Rails project's files, models, test-coverage, etc.
  DESC
  spec.homepage      = "https://github.com/rails-inspector/rails_inspector"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 11.1"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "rails", "~> 4.2"
end
