# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'grizzly/version'

Gem::Specification.new do |s|
  s.name        = "grizzly-weibo"
  s.version     = Grizzly::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stewart Matheson"]
  s.email       = ["stew@rtmatheosn.com"]
  s.homepage    = "https://github.com/stewartmatheson/grizzly"
  s.summary     = "An api wrapper for Weibo V2"
  s.description = "Grizzly makes communicating with Weibo API V2 a breeze by wrapping calls to its api in a neat ruby gem."
 
  s.required_rubygems_version = ">= 1.8.19"

  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"

  s.add_runtime_dependency "faraday", "~> 0.7.6"
  s.add_runtime_dependency "faraday-stack", "~> 0.1.5"
 
  s.files        = Dir.glob("lib/**/*") + %w(LICENSE README.markdown)
  s.require_path = 'lib'
end
