module Grizzly
  class User < Grizzly::Base
    API_COLLECTION_NAME = "users"

    def initialize(data)
      super(data)
    end

    def status
      return Grizzly::Status.new(@data["status"]) unless @data["status"].nil?
    end
  end
end
