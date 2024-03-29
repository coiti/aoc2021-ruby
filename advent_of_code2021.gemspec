# frozen_string_literal: true

require_relative "lib/advent_of_code2021/version"

Gem::Specification.new do |spec|
  spec.name = "advent_of_code2021"
  spec.version = AdventOfCode2021::VERSION
  spec.authors = ["Román Coitiño"]
  spec.email = ["roman@coiti.uy"]

  spec.summary = "Advent of Code 2021"
  spec.description = "My solutions for Advent of Code 2021"
  spec.homepage = "https://github.com/coiti/aoc2021-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/coiti/aoc2021-ruby"
  spec.metadata["changelog_uri"] =
    "https://github.com/coiti/aoc2021-ruby/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
