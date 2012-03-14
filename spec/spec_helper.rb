require File.expand_path(File.dirname(__FILE__) + '/../lib/grizzly')

require "spec_helper"
require "vcr"
require "rspec"


VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
