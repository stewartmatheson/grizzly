require 'spec_helper'

describe Grizzly::Cursor do
    
  let(:access_token) { "2.00oO1cSBga_djD33ff8552dbGV62dC" }  
  let(:user_id) { "2647476531" }
  let(:popular_user_id) { "1087770692" }

  it "should return true on next_page? when there are more than 50 friends" do
    VCR.use_cassette('friends_more_than_50', :record => :new_episodes) do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(popular_user_id)
      friends.next_page?.should eql true

      # increment the page counter by looping though friends
      friends.each { |friend| friend }

      friends.next_page?.should eql true
    end
  end
  
  it "should return false on page 2 when there are less than 50 results" do
    VCR.use_cassette('friends', :record => :new_episodes) do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(user_id)
      #friends.next_page?.should eql true

      # increment the page counter by looping though friends
      friends.each { |friend| friend }
      friends.next_page?.should == false
    end
  end

  it "should fetch the next page of users" do
    VCR.use_cassette('friends_more_than_50', :record => :new_episodes) do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(popular_user_id)
      friends.each { |user| user }
    end
  end

  it "should be able to get the entire collection of friends" do
    friends_collection = []
    total_items = 0

    VCR.use_cassette('paginated_friends_more_than_50', :record => :new_episodes) do
      client = Grizzly::Client.new(access_token)
      friends = client.friends(popular_user_id)
      total_items = friends.total_items
      while friends.next_page?
        friends.each do |friend|
          friends_collection << friend 
        end
      end
    end
    
    friends_collection.count.should eql total_items
  end
end
