module Grizzly
  class Status < Grizzly::Base

    def initialize(data)
      super(data)
    end
    
    def user
      return Grizzly::User.new(@data["user"]) unless @data["user"].nil?
    end
  end
end
