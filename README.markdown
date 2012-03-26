Grizzly
===================

### About
Grizzly is a simple API wrapper around the Weibo API V2. The name comes form the awesome Koala gem for facebook.

### Installation
Grizzly as a name was already taken on ruby gems. Awww. However grizzly-weibo was not. To install using bundler
add the following to your gem file.

```ruby
gem "grizzly-weibo"
```

### Usage
To start using grizzly you want to create a client object. This client object allows you to interact with weibo api.
This can be done creating a new object of type ```Grizzly::Client```. You will need an access token 
to do this. Currently grizzly does not support authentication with oauth. If you need to do this then I recommend
using omniauth. There is already a working strategy for Weibo.

```ruby 
client = Grizzly::Client.new(access_token)
```

### Friends
You can access a list of friends by supplying a weibo user id

```ruby
friends = client.friends(user_id)
```

This method will return an array of user friend objects. Data of these objects can be accessed via methods

```ruby
friends.first.id            #=> "1233344545356356"
friends.first.screen_name   #=> "Fred Chang"
friends.first.gender        #=> "m"
```

### Friends (Bilateral) 
Returns a list of your bilateral friends on Weibo. This list has users who are a fan of you and your are a fan of.

```ruby
friends = client.bilateral_friends(user_id)
```

This method returns the same friend object that ```client.friends``` returns.
