module Grizzly
  class Client
    def initialize(access_token = nil)
      raise Grizzly::Errors::NoAccessToken.new unless access_token
      @access_token = access_token
    end
    
    def friends(user_id)
      Grizzly::Cursor.new(Grizzly::User, "/friendships/friends", {:access_token => @access_token, :uid => user_id})
    end

    def bilateral_friends(user_id)
      Grizzly::Cursor.new(Grizzly::User, "/friendships/friends/bilateral", {:access_token => @access_token, :uid => user_id})
    end

    def status_update(status)
      raise("Must set a status") unless !status.nil?
      request = Grizzly::Request.new(:post, "/statuses/update", { :access_token => @access_token }, { :status => status } )
      Grizzly::Status.new request.response 
    end
      
    def comments(status_id)
      Grizzly::Cursor.new(Grizzly::Comment, "/comments/show", {:access_token => @access_token, :id => status_id})
    end
  end
end
