module Grizzly
  class User < Grizzly::Base
    API_COLLECTION_NAME = "users"

    def initialize(data)
      super(data)
      @data["status"] = Grizzly::Status.new(data["status"]) unless data["status"].nil?
    end
      
  end
end
