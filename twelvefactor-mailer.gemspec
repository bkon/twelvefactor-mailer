# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "twelvefactor/environment/mailer"

Gem::Specification.new do |spec|
  spec.name          = "twelvefactor-mailer"
  spec.version       = Twelvefactor::Environment::Mailer::VERSION
  spec.authors       = ["Konstantin Burnaev"]
  spec.email         = ["kbourn@gmail.com"]

  spec.summary       = <<EOF
MAILER_URL for 12-factor mailer configuration in Rails applications.
EOF

  spec.homepage      = "https://github.com/bkon/twelvefactor-mailer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "twelvefactor", "~> 1.0"
  spec.add_dependency "railties", "~> 4.1"
  spec.add_dependency "activesupport", "~> 4.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.41"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "guard-rubocop", "~> 1.2"
  spec.add_development_dependency "codecov"
end
