module Grizzly
  class Client
    def initialize(access_token = nil)
      raise Grizzly::Errors::NoAccessToken.new unless access_token
      @access_token = access_token
    end

    def friends(user_id)
      perfrom_request(:get, '/friendships/friends', {:access_token => @access_token, :uid => user_id})
    end

    private

    def perfrom_request(method, url, options)
      request = Grizzly::Request.new(method, url, options)
      request.response
    end
  end
end
