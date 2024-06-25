if @tweet.persisted? && !@tweet.changed?
    json.tweet do
      json.partial! 'api/tweets/tweet', tweet: @tweet
    end
  else
    json.errors @tweet.errors.full_messages
  end