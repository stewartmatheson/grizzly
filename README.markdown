Grizzly
===================

### About
Grizzly is a simple API wrapper around the Weibo API V2. The name comes form the awesome Koala gem for facebook.

### Usage
To start using grizzly you want to create a client object. This client object allows you to interact with weibo api.
This can be done creating a new object of type ```Grizzly::Client```. You will need an access token 
to do this

```ruby 
client = Grizzly::Client.new(access_token)
```

### Friends
You can access a list of friends by supplying a weibo user id

```ruby
friends = client.friends(user_id)
```
