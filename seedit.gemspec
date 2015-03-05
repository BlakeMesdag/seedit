# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seedit/version'

Gem::Specification.new do |spec|
  spec.name          = "seedit"
  spec.version       = Seedit::VERSION
  spec.authors       = ["Blake Mesdag"]
  spec.email         = ["blakemesdag@gmail.com"]
  spec.summary       = "Seed your database with the same power of the fixtures you're used to in test."
  spec.description   = spec.summary
  spec.homepage      = "http://github.com/BlakeMesdag/seedit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
