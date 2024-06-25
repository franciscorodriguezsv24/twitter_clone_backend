class Tweet < ApplicationRecord
  has_many :bookmarks 
  has_many :likes
  has_many :tweetreplies
  has_many :taggins
  has_many :hastags, through: :taggins
  belongs_to :user
  belongs_to :quoted_tweet, class_name: 'Tweet', foreign_key: 'quote_id', optional: true
  validates :body, length: { in: 5..255}

  #scopes  
  scope :tweets_by_user, ->(user_id) {where(user_id: user_id)}

  scope :with_replies_count, ->(user_id) {includes(:tweetreplies).where(tweetreplies: {user_id: user_id})}

  #scopes quote

  scope :quotes_count_by_user, ->(user_id) {
  where(user_id: user_id, is_quote: true)
    .select("COUNT(*) AS quotes_count")
    .group("user_id")
}

#method retweet 

def self.retweet(tweet_id)
  retweet = Tweet.find(tweet_id).update_attribute(:retweet, true)

  if retweet = true 

    return retweet
  else
    return nil 
  end
end

#method quote

def self.create_quote_tweet(user_id, text, tweet_id)

  quote_tweet = Tweet.new(
    body: text, 
    user_id: user_id,
    quote_id: tweet_id
  )
  if quote_tweet.save
  return quote_tweet
  else nil 
  end
end 

    #method hastags
    def self.create_or_find_hasgtags(text)
      hashtags = text.scan(/#\w+/)
      print hashtags 

      # hashtags.each do |tag| 
      #   hashtag_name = tag[1..-1]

        # print hashtag_name
      #   hashtag = hashtag.find_or_create_by(name: hashtag_name)

      #   unless hastags.include?(hastag)
      #     self.hastags << hashtag 
      #   end
      # end
    end 

end