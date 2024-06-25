class Follower < ApplicationRecord
    belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
    belongs_to :followee, class_name: 'User', foreign_key: 'followee_id'

#validation 
    validates_uniqueness_of :follower_id, scope: :followee_id

    #scopes
    scope :followers_user, ->(follower_id) { where(follower_id: follower_id).count}

    scope :followee_user, ->(followee_id){ where(followee_id: followee_id).count}
end
