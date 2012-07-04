module Grizzly
    class Comment < Grizzly::Base
        API_COLLECTION_NAME = "comments"
        
        def initialize(data)
            super(data)
        end
        
    end
end
