module Grizzly
  class User < Grizzly::Base
    API_COLLECTION_NAME = "users"

    def initialize(data)
      super(data)
    end
  end
end
