module Grizzly
  class Client
    def self.configure
      config = Grizzly::Config.new
      yield config
      Grizzly::Client.new(config)
    end
  end
end
