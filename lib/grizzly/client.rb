module Grizzly
  class Client
    def initialize(access_token = nil)
      raise Grizzly::Errors::NoAccessToken.new unless access_token
      @access_token = access_token
    end
    
    def friends(user_id)
      response = perfrom_request(:get, '/friendships/friends', {:access_token => @access_token, :uid => user_id})
      users = []
      response["users"].each do |user|
        users << Grizzly::User.new(user)
      end
      users
    end

    def bilateral_friends(user_id)
      response = perfrom_request(:get, '/friendships/friends/bilateral', {:access_token => @access_token, :uid => user_id})
      users = []
      response["users"].each do |user|
        users << Grizzly::User.new(user)
      end
      users
    end

    private

    def perfrom_request(method, url, options)
      request = Grizzly::Request.new(method, url, options)
      request.response
    end
  end
end
