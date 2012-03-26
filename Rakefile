$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "grizzly/version"
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
  RSpec::Core::RakeTask.new do |t|
end

desc "Generate code coverage"
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end

desc "Build the Gem"
task :build do
  system "gem build grizzly.gemspec"
end
 
desc "Release to ruby gems"
task :release => :build do
  system "gem push grizzly-#{Grizzly::VERSION}.gem"
end
