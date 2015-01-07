# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'surrounded_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "surrounded-rails"
  spec.version       = SurroundedRails::VERSION
  spec.authors       = ["'Jim Gay'"]
  spec.email         = ["jim@saturnflyer.com"]
  spec.description   = %q{This sets up your ActiveRecord and ActionController objects to use Surrounded}
  spec.summary       = %q{This sets up your ActiveRecord and ActionController objects to use Surrounded}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "surrounded", "~> 0.8.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
