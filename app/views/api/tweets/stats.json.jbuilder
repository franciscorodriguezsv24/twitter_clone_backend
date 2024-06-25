
json.tweet do
    json.set! "tweet_#{@tweet.id}" do
      json.retweets @stats_response["tweet_#{@tweet.id}"][:retweets]
      json.quotes @stats_response["tweet_#{@tweet.id}"][:quotes]
      json.likes @stats_response["tweet_#{@tweet.id}"][:likes]
      json.bookmarks @stats_response["tweet_#{@tweet.id}"][:bookmarks]
    end
  end