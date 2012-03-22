require File.expand_path(File.dirname(__FILE__) + '/../lib/grizzly')

require "spec_helper"
require "vcr"
require "rspec"

#disable SSL checking for testing
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
