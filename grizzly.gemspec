require 'grizzly/version'

Gem::Specification.new do |s|
  s.name        = "grizzly"
  s.version     = Grizzly::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stewart Matheson"]
  s.email       = ["stew@rtmatheosn.com"]
  s.homepage    = "http://github.com/carlhuda/bundler"
  s.summary     = "An api wrapper for Weibo V2"
  s.description = "Grizzly makes communicating with Weibo API V2 a breeze by wrapping calls to its api in a neat ruby gem."
 
  s.required_rubygems_version = ">= 1.8.19"
  s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("lib/**/*") + %w(LICENSE README.markdown)
  s.require_path = 'lib'
end
