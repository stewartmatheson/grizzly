require 'spec_helper'

describe Grizzly::Client do

  let(:access_token) { "2.004aXKtCl9RjUB3de807432a9ftj4C" }
  let(:invalid_access_token) { "icecream" }

  let(:user_id) { "2647476531" }
  
  it "should expect to be passed an access token" do
    -> { Grizzly::Client.new }.should raise_error(Grizzly::Errors::NoAccessToken)
  end
  
  it "should raise weibo API error when an API error is returned" do
    -> {
      VCR.use_cassette('error') do
        client = Grizzly::Client.new(invalid_access_token)
        client.friends(user_id)
      end
    }.should raise_error(Grizzly::Errors::WeiboAPI)
  end

  it "should fetch a list of friends for a given user" do
    VCR.use_cassette('friends') do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(user_id)
    end
  end

end
