if @retweet.is_a?(Tweet) && @retweet.persisted?
    json.tweet do
      json.partial! 'api/tweets/tweet', tweet: @retweet
    end
  else
      json.errors ["You've already retweeted this tweet."]
  end