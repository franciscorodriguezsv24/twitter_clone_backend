class Like < ApplicationRecord

  belongs_to :tweet
  belongs_to :user
  validates_uniqueness_of :tweet_id, scope: :user_id 

  

  #method 
  def self.liked(tweet_id, user_id)
  Like.create(tweet_id: tweet_id, user_id: user_id)
  end

  def self.disliked(like_id)
    like = Like.find_by(id: like_id)
    if like 
    like.destroy
    else
      nil
    end
  end

end
