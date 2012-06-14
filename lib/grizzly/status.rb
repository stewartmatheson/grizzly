module Grizzly
  class Status < Grizzly::Base
    API_COLLECTION_NAME = "statuses"
      
    def initialize(data)
      super(data)
      @data["user"] = Grizzly::User.new(data["user"]) unless data["user"].nil?
    end
    
  end
end
