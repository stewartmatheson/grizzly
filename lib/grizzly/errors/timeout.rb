module Grizzly
  module Errors
    class Timeout < StandardError 
      def to_s
        "The request to the Weibo API has timed out. This was most likely caused by the Weibo API not responding to given API call in a timley fashon."
      end
    end
  end
end
