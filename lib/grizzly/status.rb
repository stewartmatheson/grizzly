module Grizzly
  class Status < Grizzly::Base
    API_COLLECTION_NAME = "statuses"
      
    def initialize(data)
      super(data)
      @data["user"] = Grizzly::User.new(data["user"])
    end
    
  end
end
