if @quote_tweet.persisted?
    json.tweet do
        json.partial! 'api/tweets/tweet', tweet: @quote_tweet
      end
else
    json.errors @quote_tweet.errors.full_messages
end