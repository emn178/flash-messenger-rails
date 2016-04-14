# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flash-messenger/version'

Gem::Specification.new do |spec|
  spec.name          = "flash-messenger"
  spec.version       = FlashMessenger::VERSION
  spec.authors       = ["Chen, Yi-Cyuan"]
  spec.email         = ["emn178@gmail.com"]

  spec.summary       = %q{Integrate with flash-messenger to provide a simple flash messages.}
  spec.description   = %q{Integrate with flash-messenger to provide a simple flash messages.}
  spec.homepage      = "https://github.com/emn178/flash-messenger-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "request_store"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "actionview"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
