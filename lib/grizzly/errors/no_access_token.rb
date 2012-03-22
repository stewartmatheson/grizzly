module Grizzly
  module Errors
    class NoAccessToken < StandardError
      def to_s
        "You have not defined an access token. Grizzly needs an oauth access token to access the weibo"
      end
    end
  end
end
