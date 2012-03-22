module Grizzly
  module Errors
    class WeiboAPI < StandardError
      
      attr_accessor :error, :error_code

      def initialize(error, error_code) 
        @error, @error_code = error, error_code
      end

      def to_s
        "The Weibo API has returned an error: (#{@error_code}) - #{@error}"
      end
    end
  end
end
