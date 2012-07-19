$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "grizzly/version"
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
  RSpec::Core::RakeTask.new do |t|
end

desc "Build the Gem"
task :build do
  system "gem build grizzly.gemspec"
end
 
desc "Release to ruby gems"
task :release => :build do
  system "git tag -a #{Grizzly::VERSION} -m \"Release tag\""
  system "git push origin --tags"
  system "gem push grizzly-weibo-#{Grizzly::VERSION}.gem"
  system "rm grizzly-weibo-#{Grizzly::VERSION}.gem"
end
