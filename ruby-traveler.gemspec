# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-traveler/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-traveler"
  spec.version       = RubyTraveler::VERSION
  spec.authors       = ["Alex Clink"]
  spec.email         = ["code@alexclink.com"]

  spec.summary       = "Traveling ruby project generator"
  spec.description   = "Generates the scaffolding for a new traveling ruby project"
  spec.homepage      = "https://github.com/SleepingInsomniac/ruby-traveler"
  spec.license       = "MIT"

  spec.files         = Dir["bin/*"].concat(Dir["lib/**/*"])
  spec.executables   = [
    "travel"
  ]
  spec.require_paths = [
    'lib'
  ]
  
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  
  spec.add_dependency 'activesupport', '~> 4.2'
  spec.add_dependency 'thor', '~> 0.19.1'
end
