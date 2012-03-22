module Grizzly
  class Client
    def initialize(access_token = nil)
      raise Grizzly::Errors::NoAccessToken.new unless access_token
      @access_token = access_token
    end

    def friends
      perfrom_request(:get, '/friendships/friends.json', {:access_token => @access_token})
    end

    private

    def perfrom_request(method, url, options)
      request = Grizzly::Request.new(method, url, options)
      request.response
    end
  end
end
