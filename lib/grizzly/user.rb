module Grizzly
  class User < Grizzly::Base
    API_COLLECTION_NAME = "users"

    def initialize(data)
      super(data)
    end

	#def statuses
	#	Grizzly::Cursor.new(Grizzly::Status, "/statuses/user_timeline", {:access_token => @access_token, :uid => self.  })
	#end

  end
end
