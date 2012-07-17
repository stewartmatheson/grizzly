module Grizzly
  class Status < Grizzly::Base

    def initialize(data)
      super(data)
      @data["user"] = Grizzly::User.new(data["user"]) unless data["user"].nil?
    end
    
  end
end
