require 'spec_helper'

describe Grizzly::Cursor do
  let(:access_token) { "2.004aXKtCl9RjUBfb2d4f0fbb0Y9nPt" }
  let(:user_id) { "2647476531" }
  let(:popular_user_id) { "1087770692" }

  it "should return true on next_page? when there are more than 50 friends" do
    VCR.use_cassette('friends_more_than_50') do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(popular_user_id)
      friends.next_page?.should eql true
    end
  end
  
  it "should return false on next_page? when there are less than 50 results" do
    VCR.use_cassette('friends') do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(user_id)
      friends.next_page?.should eql false
    end
  end

  it "should fetch the next page of users" do
    VCR.use_cassette('friends_more_than_50', :record => :new_episodes) do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(popular_user_id)
      friends.next_page { |user| user }
    end
  end
end
